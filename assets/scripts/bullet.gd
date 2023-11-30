extends RayCast2D


@export var bulletLifetime = 1.0


func _ready():
	$LifeTimer.start(bulletLifetime)
	$Line2D.add_point(Vector2.ZERO)
#	print("Bullet shot.")


func _process(_delta):
	var target = get_collider()
	if target != null and target.is_in_group("mortal"):
		target.take_damage(50, " lead poisoning")
		$Line2D.add_point(get_collision_point() - global_position)
		set_process(false)
	else:
		$Line2D.add_point(target_position - global_position)

func _on_life_timer_timeout():
#	print("Timer out.")
	queue_free()
