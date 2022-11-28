extends Node


# Declare member variables here. Examples:
var num = 10
var spawnBucket
var spawnThreshhold = 100
var spawnBucketMax = 1000
var missionTime = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(_delta):
	#$UIContainer/GameUI.set_position()
	if Input.is_action_just_released("EMERGENCYQUIT"):
		quitGame()

func startGame():
	spawnBucket = spawnBucketMax
	randomize()
	var player = load("PlayerContainer.tscn").instance()
	add_child(player)
	spawnBoulder(rand_range(1,40))
	$SpawnTimer.start()

func spawnEnemy(amount):
	for i in amount:
		var foe = load("swarm.tscn").instance()
		foe.maxHP = randi()%250
		foe.target = $PlayerContainer/PlayerRBody.position
		foe.speed = randi()%200
		foe.attackRange = randi()%50
		foe.position = Vector2(randi()%1000 -500, randi()%1000 -500)
		$EnemyContainer.add_child(foe)
		spawnBucket -= spawnThreshhold

func spawnBoulder(amount):
	for i in amount:
		var boulder = load("ContextObstacle.tscn").instance()
		$WorldContainer.add_child(boulder)
		boulder.position = Vector2(randi()%1000 -500, randi()%1000 -500)
		i -= 1

func _on_SpawnTimer_timeout():
	missionTime += 0.5
	spawnBucket += 10
	if spawnBucket >= spawnThreshhold:
		spawnEnemy(rand_range(1, 10))

func _on_EnemyRBody_dead(value):
	spawnBucket += value

func _on_MainMenu_GameStart():
	startGame()
	$UIContainer/MainMenu.hide()

func _on_MainMenu_QuitGame():
	quitGame()


func _on_MissionTimer_timeout():
	missionTime += 1
	print(missionTime)

func quitGame():
	get_tree().quit()
