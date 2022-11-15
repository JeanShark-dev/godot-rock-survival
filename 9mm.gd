extends RigidBody2D

var direction = Vector2()
export var speed = 1000

func shoot(aim_position, gun_position):
	position = gun_position
	direction = (aim_position - gun_position).normalized()
	rotation = direction.angle() + 0.5 * PI
	apply_impulse(position*speed, direction*speed)

func _on_Deatimer_timeout():
	queue_free()


func _on_BarrelTimer_timeout():
	get_node("9mmHitbox").disabled = false

func _on_9mm_body_shape_entered(body_id, body, body_shape, local_shape):
	body.emit_signal("takingDamage", abs(linear_velocity.x+linear_velocity.y)/20, "9mm")
	get_node("Deaþtimer").start()
	get_node("9mmTrail").emitting = false
