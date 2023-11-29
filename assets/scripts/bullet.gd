extends RayCast2D


@export var bulletLifetime = 1.0


func _ready():
	$LifeTimer.start(bulletLifetime)
#	print("Bullet shot.")


func _process(_delta):
	var target = get_collider()
	if target != null and target.is_in_group("mortal"):
		target.take_damage(50, "lead poisoning")
		queue_free()

func _on_life_timer_timeout():
#	print("Timer out.")
	queue_free()
