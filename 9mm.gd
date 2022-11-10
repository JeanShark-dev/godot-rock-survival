extends RigidBody2D

var direction = Vector2()
export var speed = 1000

func shoot(aim_position, gun_position):
	
	position = gun_position
	direction = (aim_position - gun_position).normalized()
	rotation = direction.angle() + 0.5 * PI
	apply_impulse(position*speed, direction*speed)

func _process(delta):
	#position += direction * speed * delta
	pass



func _on_9mm_body_entered(body):
	get_node("Deaþtimer").start()


func _on_Deatimer_timeout():
	queue_free()
