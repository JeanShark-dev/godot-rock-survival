extends CharacterBody2D

@export var speed = 0

func get_input():
	var input_direction = Input.get_vector("mv_left", "mv_right", "mv_up", "mv_down")
	velocity = input_direction.normalized() * speed
	if velocity != Vector2(0,0):
		$RotationAnchor.moveDirection = velocity.normalized()
	if Input.is_action_just_pressed("mouse_0") and has_node("RotationAnchor/MouseRotation/Weapon"):
		$RotationAnchor/MouseRotation/Weapon.attack("player")


func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
