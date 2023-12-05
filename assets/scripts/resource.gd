extends Area2D


var drop_scene = preload("res://assets/scenes/pickup.tscn")

@export var drop = ""
@export var drop_amount_range = [1,1]
@export var harvest_work = 10


var world_container
var main


func _ready():
	add_to_group("resource")
	world_container = get_parent()
	main = world_container.get_parent()


func harvest(delta, multiplier, drop_multiplier):
	harvest_work -= delta * multiplier
	if harvest_work < 0:
		drop_item(drop_multiplier)


func drop_item(multiplier):
	var harvest_amount = randi_range(drop_amount_range[0], drop_amount_range[1] * multiplier)
	for i in harvest_amount:
		var pickup = drop_scene.instantiate()
		world_container.add_child(pickup)
		pickup.position = position
		pickup.itemType = drop
