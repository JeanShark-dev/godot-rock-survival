extends CharacterBody2D


var movement_speed_base = 100


func get_input():
	var input_direction = Input.get_vector("mv_left", "mv_right", "mv_up", "mv_down")	#very simple movement, stolen from official docs
	velocity = input_direction * movement_speed_base


func _physics_process(delta):
	get_input()
	move_and_slide()
