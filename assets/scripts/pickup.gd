extends Area2D


var itemType
@export var automatic_pickup = true


func _ready():
	add_to_group("pickup")
