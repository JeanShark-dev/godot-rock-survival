extends Node2D


export (PackedScene) var Projectile
export (float) var muzzleVelocity
export (float) var imprecision
export (float) var barrelLength
export (float) var weaponDamage
export (float) var rechamberTime
var canShoot = true
var target = Vector2()
var playerDamage
var damageSource

func _ready():
	$RechamberTimer.wait_time = rechamberTime

func _process(delta):
	if Input.is_action_pressed("M1") and canShoot == true:
		Shoot()

func Update(targetImport, playerDamageImport, damageSourceImport):
	target = targetImport
	playerDamage = playerDamageImport
	damageSource = damageSourceImport

func Shoot():
	var projectile = Projectile.instance()
	add_child(projectile)
	projectile.damage = projectile.damage * playerDamage * weaponDamage
	projectile.source = damageSource
	projectile.position += target.limit_length(barrelLength)
	projectile.Shoot(muzzleVelocity,Vector2(target + Vector2(rand_range(-imprecision, imprecision), rand_range(-imprecision, imprecision))))
	canShoot = false
	$RechamberTimer.start()


func _on_RechamberTimer_timeout():
	canShoot = true
