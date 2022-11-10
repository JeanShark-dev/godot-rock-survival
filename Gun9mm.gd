extends Node2D
var shoot
var rechamberTime
export (float) var rechamberTimeMax
export (PackedScene) var Bullet
onready var BulletContainer = get_node("..")

func _shoot():
	var pew = Bullet.instance()
	BulletContainer.add_child(pew)
	pew.shoot(get_global_mouse_position(), position)

func _process(delta):
	if rechamberTime > 0:
		rechamberTime = 0
	if rechamberTime < 0:
		rechamberTime -= delta
	if (Input.is_action_just_pressed("M1")):
		_shoot()
		rechamberTime = rechamberTimeMax
