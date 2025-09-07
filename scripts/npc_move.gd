extends CharacterBody2D

@export var speed: float = 100

var move_velocity = Vector2()

func _process(delta: float) -> void:
	find_path(delta)
	move_and_collide(move_velocity)

func find_path(delta):
	var move_target = find_target()
	if move_target == null:
		move_velocity = Vector2.ZERO
	else:
		move_velocity = position.direction_to(move_target) * speed * delta

func find_target():
	var target = get_global_mouse_position()
	if position.distance_to(target) <= 10:
		target = null
	return target
