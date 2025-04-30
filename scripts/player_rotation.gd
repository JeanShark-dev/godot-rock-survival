extends Node2D

var aimDirection
var moveDirection = Vector2(0,0)

func _process(delta: float) -> void:
	aimDirection = get_angle_to(get_global_mouse_position())
	$AimDirectionIndicator.rotation = aimDirection
	$MoveDirectionIndicator.rotation = moveDirection.angle()
