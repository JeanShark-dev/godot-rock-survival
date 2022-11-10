extends Node2D

var handPosition = Vector2()

func _process(delta):
	handPosition = get_node("PlayerKBody").position
	get_node("ProjectileContainer/Gun9mm").set_position(handPosition)
