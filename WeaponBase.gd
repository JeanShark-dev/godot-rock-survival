extends Node2D


export (PackedScene) var Projectile




func Shoot(position, target, damageModifier, damageSource, velocity, imprecision):
	var projectile = Projectile.instance()
	projectile.position = position
	projectile.look_at(target)
	projectile.rotation += rand_range(-imprecision, imprecision)
	
