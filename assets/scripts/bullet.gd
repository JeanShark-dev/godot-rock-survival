extends RigidBody2D


@export var bulletLifetime = 1.0


func _ready():
	$LifeTimer.start(bulletLifetime)


func _on_life_timer_timeout():
	queue_free()
