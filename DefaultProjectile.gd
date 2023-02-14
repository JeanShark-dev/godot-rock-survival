extends RigidBody2D


export (float) var damage
var source


func _ready():
	position = get_parent().position


func Shoot(velocity,target):

	apply_central_impulse(Vector2(target-position).normalized() * velocity)
	var newParent = get_parent().get_parent().get_parent()
	get_parent().remove_child(self)
	newParent.add_child(self)



func _on_Timer_timeout():
	queue_free()


func _on_DefaultProjectile_body_entered(body):
	if body.has_method("takeDamage"):
#		print("Target can take damage.")
		body.takeDamage(damage, source)
