extends RigidBody2D


var damage
var source

func Shoot(velocity):
	print(rotation,position)
	apply_central_impulse(Vector2().rotated(rotation)*velocity)
	print("Projectile shot successfully")
