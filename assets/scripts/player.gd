extends CharacterBody2D


var movement_speed_base = 100
var mouse_target = null
var areas_in_range = []


func get_mouse_target(target):
	mouse_target = target


func harvest(delta):
	if mouse_target == null:
		return
	if mouse_target.is_in_group("resource") and areas_in_range.has(mouse_target):
		mouse_target.harvest(delta, 1, 1)


func get_movement():
	var input_direction = Input.get_vector("mv_left", "mv_right", "mv_up", "mv_down")	#very simple movement, stolen from official docs
	velocity = input_direction * movement_speed_base


func _process(delta):
	if Input.is_action_pressed("mouse0"):
		harvest(delta)


func _physics_process(delta):
	get_movement()
	move_and_slide()


func _on_reach_area_area_entered(area):
	areas_in_range.append(area)


func _on_reach_area_area_exited(area):
	areas_in_range.erase(area)
