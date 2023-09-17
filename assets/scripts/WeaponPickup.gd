extends Area2D


@export var weapon = preload("res://flintlock_pistol.tscn").instantiate()
@export var weaponName = "Flintlock Pistol"
@export var weaponSprite = preload("res://assets/sprites/weapons/flintlock-pistol.svg")
@export var spriteSize = 1.0


func _ready():
	$Sprite2D.texture = weaponSprite
	$Sprite2D.apply_scale(Vector2(spriteSize, spriteSize))
	self.add_to_group("weaponPickup", true)


func toolTipShow():
	$Tooltip.show()


func toolTipHide():
	$Tooltip.hide()


