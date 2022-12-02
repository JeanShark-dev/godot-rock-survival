extends Node


# Declare member variables here. Examples:
var num = 10
var spawnBucket
var spawnThreshhold = 100
var spawnBucketMax = 1000
signal scoreAdd(scorePlus)

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
	$Camera2D.current = false
	var player = load("PlayerContainer.tscn").instance()
	add_child(player)
	#player = get_node("PlayerContainer")
	#connect("scoreAdd", player, "on_Main_scoreAdd")
	spawnBoulder(rand_range(1,40))
	$SpawnTimer.start()

func spawnEnemy(amount):
	for i in amount:
		var foe = load("swarm.tscn").instance()
		foe.maxHP = randi()%250
		foe.target = $PlayerContainer/PlayerRBody.position
		foe.speed = rand_range(50,250)
		foe.attackRange = randi()%50
		foe.position = Vector2(randi()%1000 -500, randi()%1000 -500)
		var vis = rand_range(0.5,4)
		foe.get_node("EnemyVision").get_node("EnemyVisionField").scale = Vector2(vis, vis)
		foe.connect("dead", self, "_on_EnemyRBody_dead")
		$EnemyContainer.add_child(foe)
		spawnBucket -= spawnThreshhold

func spawnBoulder(amount):
	for i in amount:
		var boulder = load("ContextObstacle.tscn").instance()
		$WorldContainer.add_child(boulder)
		boulder.position = Vector2(randi()%1000 -500, randi()%1000 -500)
		i -= 1

func reset():
	$SpawnTimer.stop()
	while ($WorldContainer.get_child_count() != 0):
		$WorldContainer.remove_child($WorldContainer.get_child(0))
	while ($EnemyContainer.get_child_count() != 0):
		$EnemyContainer.remove_child($EnemyContainer.get_child(0))
	var player = get_node("PlayerContainer")
	player.queue_free()
	$UIContainer/MainMenu.show()
	$Camera2D.current = true

func _on_SpawnTimer_timeout():
	spawnBucket += 10
	if spawnBucket >= spawnThreshhold:
		spawnEnemy(rand_range(1, 10))

func _on_EnemyRBody_dead(value):
	spawnBucket += value
	self.emit_signal("scoreAdd", value)

func _on_MainMenu_GameStart():
	startGame()
	$UIContainer/MainMenu.hide()

func _on_MainMenu_QuitGame():
	quitGame()

func quitGame():
	get_tree().quit()
