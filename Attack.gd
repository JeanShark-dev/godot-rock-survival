extends Area2D


var damage
var source
var type

# Called when the node enters the scene tree for the first time.
func _ready():
	$AttackParticles.emitting = true
	scale = Vector2(2,1)
	#print(damage, source, type)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LifetimeTimer_timeout():
	queue_free()



func _on_Attack_body_entered(body):
	if body.has_method("takeDamage"):
		body.takeDamage(damage, source)

