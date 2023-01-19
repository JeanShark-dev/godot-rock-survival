extends Node2D
var shoot
var rechamberTime = 0
export (float) var rechamberTimeMax = 1
export (PackedScene) var Bullet
export (int) var magSize = 10
export (int) var reserveMags = 3
onready var magCount = magSize
onready var reserveAmmo = magSize * reserveMags
onready var BulletContainer = get_node("..")
var randomBulletSpread = 10



func _shoot():
	magCount -= 1
	var pew = Bullet.instance()
	BulletContainer.add_child(pew)
	pew.shoot(get_global_mouse_position(), position, get_parent().get_parent().get_node("PlayerRBody").get_rid(), randomBulletSpread)


func Reload():
	print("Reloading!")
	$ReloadTimer.start()


func _process(delta):
	if rechamberTime < 0:
		rechamberTime = 0
	if rechamberTime > 0:
		rechamberTime -= 10*delta
		pass
	if (Input.is_action_just_pressed("gp_reload") && magCount < magSize):
		Reload()
	if (Input.is_action_pressed("M1") && rechamberTime == 0 && magCount > 1):
		_shoot()
		rechamberTime = rechamberTimeMax
