extends RigidBody2D

var speed = 500
export (float) var maxHP
onready var HP = maxHP
var incomingDamage = 0
var canTakeDamage = true
var target = Vector2()
var seesPlayer = false
var targetObject
signal takingDamage(damageNum, damageSource)
var dying = false

func _physics_process(delta):
	if position.distance_to(target) > 5:
		apply_central_impulse(position.direction_to(target)*speed)

func _process(_delta):
	if !seesPlayer && $GiveUpTimer.wait_time == 20:
		$GiveUpTimer.wait_time = 19
		$GiveUpTimer.start()
	if seesPlayer:
		target = targetObject.position

func takeDamage(damageNum):
	incomingDamage = damageNum
	HP -= incomingDamage
	incomingDamage -= incomingDamage
	canTakeDamage = false
	$IFrameTimer.start()
	if dying:
		pass
	if HP <= 0:
		dying = true
		die()

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
	die()


func _on_DeaTimer_timeout():
	queue_free()


func _on_IFrameTimer_timeout():
	canTakeDamage = true


func _on_EnemyRBody_takingDamage(damageNum, damageSource):
	takeDamage(damageNum)
	#print("OW! Took ", damageNum,  " damage from ", damageSource, "!")
