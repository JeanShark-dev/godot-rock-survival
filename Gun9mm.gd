extends Node2D
var shoot
var rechamberTime = 0
export (float) var rechamberTimeMax = 1
export (PackedScene) var Bullet
onready var BulletContainer = get_node("..")
var randomBulletSpread = 10



func _shoot():
	var pew = Bullet.instance()
	BulletContainer.add_child(pew)
	pew.shoot(get_global_mouse_position(), position, get_parent().get_parent().get_node("PlayerRBody").get_rid(), randomBulletSpread)

func _process(delta):
	if rechamberTime < 0:
		rechamberTime = 0
	if rechamberTime > 0:
		rechamberTime -= 10*delta
		pass
	if (Input.is_action_just_pressed("M1") && rechamberTime == 0):
		_shoot()
		rechamberTime = rechamberTimeMax
