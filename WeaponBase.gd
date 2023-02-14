extends Node2D


export (PackedScene) var Projectile
export (float) var muzzleVelocity
export (float) var imprecision
export (float) var barrelLength
export (float) var weaponDamage
export (float) var rechamberTime
export (bool) var isAuto
var canShoot = true
var isCurrentWeapon = false
var target = Vector2()
var playerDamage
var damageSource
var projectileContainer

func _ready():
	$RechamberTimer.wait_time = rechamberTime
	projectileContainer = get_parent().get_parent()

func _process(delta):
	if Input.is_action_pressed("M1") and canShoot == true and isAuto == true:
		Shoot()
	elif Input.is_action_just_pressed("M1") and canShoot == true:
		Shoot()

func Update(targetImport, playerDamageImport, damageSourceImport):
	target = targetImport
	playerDamage = playerDamageImport
	damageSource = damageSourceImport

func Shoot():
	if isCurrentWeapon == true:
		var projectile = Projectile.instance()
		add_child(projectile)
		projectile.damage = projectile.damage * playerDamage * weaponDamage
		projectile.source = damageSource
		projectile.position += target.limit_length(barrelLength)
		projectile.rotation = target.angle() + 0.5 * PI
		target = get_global_mouse_position()
		projectile.Shoot(muzzleVelocity,Vector2(target + Vector2(rand_range(-imprecision, imprecision), rand_range(-imprecision, imprecision))))
		canShoot = false
		$RechamberTimer.start()


func _on_RechamberTimer_timeout():
	canShoot = true
