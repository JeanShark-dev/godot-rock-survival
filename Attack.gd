extends Area2D


var damage
var source
var type

# Called when the node enters the scene tree for the first time.
func _ready():
	$AttackParticles.emitting = true
	#print(damage, source, type)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LifetimeTimer_timeout():
	queue_free()


func _on_Attack_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	body.emit_signal("takingDamage", damage, source)
