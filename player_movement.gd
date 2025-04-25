extends CharacterBody2D

@export var speed = 0

func get_input():
	var input_direction = Input.get_vector("mv_left", "mv_right", "mv_up", "mv_down")
	velocity = input_direction.normalized() * speed

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
