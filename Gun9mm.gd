extends Node2D
var shoot

export (PackedScene) var Bullet
onready var BulletContainer = get_node("..")

func _shoot():
	var pew = Bullet.instance()
	BulletContainer.add_child(pew)

	pew.shoot(get_global_mouse_position(), position)

func _process(delta):
	
	if (Input.is_action_just_pressed("M1")):
		_shoot()
