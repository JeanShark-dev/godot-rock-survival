extends RigidBody2D

export (float) var speed
export (float) var maxHP
export (float) var attackRange
onready var HP = maxHP
var incomingDamage = 0
var canTakeDamage = true
var target = Vector2()
var seesPlayer = false
var targetObject
signal takingDamage(damageNum, damageSource)
signal dead(value)
var dying = false
var canAttack = true

func _physics_process(delta):
	if position.distance_to(target) > attackRange+20:
		apply_central_impulse(position.direction_to(target)*speed)

func _process(_delta):
	if !seesPlayer && $GiveUpTimer.wait_time == 20:
		$GiveUpTimer.wait_time = 19
		$GiveUpTimer.start()
	if seesPlayer:
		target = targetObject.position
	if position.distance_to(target) < attackRange and canAttack == true:
		canAttack = false
		$AttackingEffect.emitting = true
		$AttackTimer.wait_time = 1
		$AttackTimer.start()

func takeDamage(damageNum):
	if dying:
		pass
	incomingDamage = damageNum
	HP -= incomingDamage
	incomingDamage -= incomingDamage
	if HP <= 0:
		dying = true
		die()

func attack(damage, source):
	$AttackingEffect.emitting = false

func die():
	$EnemySpriteTemp.hide()
	$EnemyHitbox.scale = Vector2(0,0)
	$"DeaþEffect".emitting = true
	$"DeaþTimer".start()

func _on_EnemyVision_body_shape_entered(body_id, body, body_shape, area_shape):
	targetObject = body
	target = body.position
	seesPlayer = true
	$GiveUpTimer.stop()
	$GiveUpTimer.wait_time = 20

func _on_EnemyVision_body_shape_exited(body_id, body, body_shape, area_shape):
	target = position
	seesPlayer = false


func _on_GiveUpTimer_timeout():
	queue_free()


func _on_DeaTimer_timeout():
	emit_signal("dead", 100)
	queue_free()


func _on_EnemyRBody_takingDamage(damageNum, damageSource):
	takeDamage(damageNum)
	#print("OW! Took ", damageNum,  " damage from ", damageSource, "!")


func _on_AttackTimer_timeout():
	attack(10, "bite")
	canAttack = true
