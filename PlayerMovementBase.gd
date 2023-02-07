extends RigidBody2D

export (float) var baseMoveSpeed
var moveVelocity = Vector2()
signal takingDamage(damageNum, damageSource)

func GetMoveInput():
	moveVelocity = Vector2()
	if (Input.is_action_pressed("gp_up")):
		moveVelocity.y -= baseMoveSpeed
	if (Input.is_action_pressed("gp_down")):
		moveVelocity.y += baseMoveSpeed
	if (Input.is_action_pressed("gp_left")):
		moveVelocity.x -= baseMoveSpeed
	if (Input.is_action_pressed("gp_right")):
		moveVelocity.x += baseMoveSpeed
	moveVelocity = moveVelocity.normalized() * baseMoveSpeed

func _process(delta):
	GetMoveInput()

func _physics_process(delta):
	apply_central_impulse(moveVelocity*delta*mass*2)

func takeDamage(damage, source):
	emit_signal("takingDamage", damage, source)
	
