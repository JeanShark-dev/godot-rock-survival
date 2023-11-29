extends Area2D


var pickupCandidate
var weaponDrop = preload("res://weapon_pickup.tscn")


@onready var hud = get_parent().get_node("GUI/HUD/WeaponHUD")
@onready var hudSprite = get_parent().get_node("GUI/HUD/WeaponHUD/WeaponSprite")
@onready var hudName = get_parent().get_node("GUI/HUD/WeaponHUD/VSplitContainer/WeaponName")
@onready var worldSpace = get_parent().get_parent().get_parent()


func _ready():
	#print(worldSpace)
	pass


func _process(_delta):
	if Input.is_action_just_pressed("gp_use")  && pickupCandidate != null:
		pickWeapon(pickupCandidate)
	if Input.is_action_just_pressed("gp_drop") && $WeaponSlot.get_child_count() != 0:
		dropWeapon()


func pickWeapon(weapon):
	if weapon.is_in_group("weaponPickup") && $WeaponSlot.get_child_count() == 0:
		$WeaponSlot.add_child(weapon.weaponFile)
		var weaponSprite = weapon.get_node("Sprite2D").texture
		var weaponName = weapon.weaponName
		hudSprite.texture = weaponSprite
		hudName.text = weaponName
		weapon.queue_free()

func dropWeapon():
	var currentWeapon = $WeaponSlot.get_child(0)
	var droppingWeapon = weaponDrop.instantiate()
#	print(currentWeapon)
#	print(droppingWeapon)
	droppingWeapon.weaponPath = $WeaponSlot.get_child(0).weapon
	droppingWeapon.position = global_position
#	print(droppingWeapon.weaponPath)
	worldSpace.add_child(droppingWeapon)
	currentWeapon.queue_free()
	hudSprite.texture = null
	hudName.text = ""


func _on_area_entered(area):
	if pickupCandidate == null:
		pickupCandidate = area
	if area.is_in_group("weaponPickup"):
		candidateHide()
		pickupCandidate = area
		candidateShow()


func candidateShow():
	if pickupCandidate.is_in_group("weaponPickup") && pickupCandidate != null:
		pickupCandidate.toolTipShow()


func candidateHide():
	if pickupCandidate.is_in_group("weaponPickup") && pickupCandidate != null:
		pickupCandidate.toolTipHide()


func _on_area_exited(area):
	if area.is_in_group("weaponPickup") && pickupCandidate != null:
		pickupCandidate.toolTipHide()
		pickupCandidate = null
