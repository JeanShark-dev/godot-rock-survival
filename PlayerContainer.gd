extends Node2D

var handPosition = Vector2()

func _ready():
	$Node2D/GameUI.rect_size = OS.window_size
	$Node2D/GameUI.rect_position = -OS.window_size/2

func _process(_delta):
	handPosition = get_node("PlayerRBody").position
	get_node("ProjectileContainer/Gun9mm").set_position(handPosition)
