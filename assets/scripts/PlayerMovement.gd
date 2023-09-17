extends CharacterBody2D


var direction = Vector2()

@export var baseSpeed = 0.0


func _process(delta):
	take_input()
	move_and_collide(velocity*delta*baseSpeed)


func take_input():
	direction = Vector2()
	if Input.is_action_pressed("gp_up"):
		direction.y -= 1
	if Input.is_action_pressed("gp_down"):
		direction.y += 1
	if Input.is_action_pressed("gp_left"):
		direction.x -= 1
	if Input.is_action_pressed("gp_right"):
		direction.x += 1
	velocity = direction.normalized()
