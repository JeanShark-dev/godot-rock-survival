extends RigidBody2D


export (float) var damage
var source

func Shoot(velocity,target):
	rotation = target.angle() + 0.5 * PI
	apply_central_impulse(Vector2(target-position).normalized() * velocity)



func _on_Timer_timeout():
	queue_free()


func _on_DefaultProjectile_body_entered(body):
	if body.has_method("takeDamage"):
		body.takeDamage(damage, source)
