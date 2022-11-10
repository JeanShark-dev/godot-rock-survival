extends RigidBody2D

var direction = Vector2()
export var speed = 1000

func shoot(aim_position, gun_position):
	position = gun_position
	direction = (aim_position - gun_position).normalized()

	apply_impulse(position*speed, direction*speed)

func _on_9mm_body_entered(body):
	get_node("Deaþtimer").start()

func _on_Deatimer_timeout():
	queue_free()
