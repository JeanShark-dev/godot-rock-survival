extends "res://WeaponBase.gd"


# Declare member variables here. Examples:
export (int) var magSize
export (int) var magAmount
export (int) var maxAmmo

class Magazine:
	pass



func _on_RechamberTimer_timeout():
	canShoot = true
