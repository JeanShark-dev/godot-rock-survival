extends Node2D


# Declare member variables here. Examples:
var num = 10
var spawnBucket
var spawnThreshhold = 100
var spawnBucketMax = 1000


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func startGame():
	spawnBucket = spawnBucketMax
	randomize()
	var player = load("PlayerContainer.tscn").instance()
	add_child(player)
	spawnBoulder(rand_range(1,20))
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
	spawnBucket += 10
	if spawnBucket >= spawnThreshhold:
		spawnEnemy(rand_range(1, 10))

func _on_EnemyRBody_dead(value):
	spawnBucket += value


func _on_Button_pressed():
	startGame()
	$UIContainer/HSplitContainer/StartGameButton.hide()
