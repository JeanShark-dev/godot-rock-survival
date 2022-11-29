extends Node2D

var handPosition = Vector2()
signal scoreAdd(scorePlus)

func _ready():
	$Node2D/GameUI.rect_size = OS.window_size
	$Node2D/GameUI.rect_position = -OS.window_size/2
	var parent = get_parent()
	parent.connect("scoreAdd", self, "_on_Main_scoreAdd")
	parent.emit_signal("scoreAdd", 0)

func _process(_delta):
	handPosition = get_node("PlayerRBody").position
	get_node("ProjectileContainer/Gun9mm").set_position(handPosition)

func _on_Main_scoreAdd(scorePlus):
	emit_signal("scoreAdd", scorePlus)
