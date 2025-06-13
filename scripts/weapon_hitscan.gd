extends Node2D

@export var base_damage = 1
@export var base_cooldown = 1
@export var base_damage_type = "magic"
@export var base_range = 1000
@export var muzzle_flare = load("res://scenes/muzzle-flash.tscn")


func attack(damage_allegiance, damage_add = 0, damage_mult = 1, damage_effect = "none"):
	var collider = $RayCast2D.get_collider()
	$RayCast2D.target_position = Vector2(1,0) * base_range
	var new = muzzle_flare.instantiate()
	$Firepoint.add_child(new)
	
	if collider == null:
		return
	if collider.has_method("take_damage"):
		collider.take_damage((base_damage + damage_add * damage_mult), base_damage_type, "none", damage_allegiance)
