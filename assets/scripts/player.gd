extends CharacterBody2D


var movement_speed_base = 100
var mouse_target = null


func get_mouse_target():
	pass


func harvest(delta):
	if mouse_target.is_in_group("resource"):
		mouse_target.harvest(delta, 1, 1)


func get_movement():
	var input_direction = Input.get_vector("mv_left", "mv_right", "mv_up", "mv_down")	#very simple movement, stolen from official docs
	velocity = input_direction * movement_speed_base


func _process(delta):
	pass


func _physics_process(delta):
	get_movement()
	move_and_slide()
