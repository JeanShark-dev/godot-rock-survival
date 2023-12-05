extends Area2D


var drop_scene = preload("res://assets/scenes/pickup.tscn")

@export var drop = ""
@export var drop_amount_range = [1,1]
@export var harvest_work = 10

var has_mouse = false

var world_container
var main


func _ready():
	add_to_group("resource")
	world_container = get_parent()
	main = world_container.get_parent()


func harvest(delta, multiplier, drop_multiplier):
	harvest_work -= delta * multiplier
	print(harvest_work)
	if harvest_work < 0:
		drop_item(drop_multiplier)


func drop_item(multiplier):
	var harvest_amount = randi_range(drop_amount_range[0], drop_amount_range[1] * multiplier)
	for i in harvest_amount:
		var pickup = drop_scene.instantiate()
		world_container.add_child(pickup)
		pickup.position = position
		pickup.itemType = drop
		queue_free()


func _on_mouse_entered():
	has_mouse = true


func _on_mouse_exited():
	has_mouse = false
	main.object_mouse_handling(null)


func _on_input_event(_viewport, _event, _shape_idx):
	if has_mouse and Input.is_action_just_pressed("mouse0"):
		main.object_mouse_handling(self)
