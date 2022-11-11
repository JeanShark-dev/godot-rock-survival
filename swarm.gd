extends RigidBody2D

var speed = 500
var hp = 10
var incomingDamage = 0
var target = Vector2()
var seesPlayer = false
var targetObject

func _physics_process(delta):
	if position.distance_to(target) > 5:
		apply_central_impulse(position.direction_to(target)*speed)

func _process(_delta):
	if !seesPlayer && $GiveUpTimer.wait_time == 20:
		$GiveUpTimer.wait_time = 19
		$GiveUpTimer.start()
		print("a")
	if seesPlayer:
		target = targetObject.position

func takeDamage():
	pass

func die():
	$EnemySpriteTemp.hide()
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
