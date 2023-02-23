extends "res://WeaponBase.gd"


# Declare member variables here. Examples:
export (int) var magSize
export (int) var magAmount
export (int) var maxAmmo
export (float) var reloadTime
var ammoLeft
var magazineBase = load("Magazine.tscn")
var currentMag
var replenishingMag

func _ready():
	magSize -= 1
	ammoLeft = maxAmmo
	$ReloadTimer.wait_time = reloadTime
	for i in range(magAmount):
		var magazine = magazineBase.instance()
		magazine.amount = magSize
		$MagContainer.add_child(magazine)
	$MagContainer.get_child(0).isCurrent = true
	currentMag = $MagContainer.get_child(0)


func _process(_delta):
	if isCurrentWeapon == false:
		return
	if Input.is_action_just_pressed("gp_reload") && ammoLeft > 0:
		canShoot = false
		$ReloadTimer.start()
	elif Input.is_action_just_pressed("gp_reload"):
		print("No ammo!")


func reload():
	currentMag.isCurrent = false
	var newMagazine
	newMagazine = currentMag
	for i in $MagContainer.get_child_count():
		if $MagContainer.get_child(i).amount > newMagazine.amount && $MagContainer.get_child(i).amount > 0:
			newMagazine = $MagContainer.get_child(i)
	currentMag = newMagazine	
	if currentMag.amount <= 0 && ammoLeft > 0:
		print("All mags empty! Replenishing")
		replenishingMag = currentMag
		$ReplenishTimer.start()
		return
	elif ammoLeft <= 0:
		print("Out of ammo, can't reload!")
		return
	print("Reloaded!")
	currentMag.isCurrent = true
	$RechamberTimer.start()


func replenishMags():
	canShoot = false
	for i in $MagContainer.get_child_count():
		if $MagContainer.get_child(i).amount < magSize:
			replenishingMag = $MagContainer.get_child(i)
			$ReplenishTimer.start()
			return
	print("All mags full. Reloading...")
	print(ammoLeft, " ammo left.")
	reload()



func _on_RechamberTimer_timeout():
	if currentMag.amount > 0:
		canShoot = true
		currentMag.amount -= 1
		return
	print("Out of ammo. Reloading...")
	$ReloadTimer.start()



func _on_ReloadTimer_timeout():
	reload()


func _on_ReplenishTimer_timeout():
	if ammoLeft > 0:
		print("Replenishing ammo in mags...")
		ammoLeft -= 1
		replenishingMag.amount += 1
		replenishMags()
		return
	reload()
	print("Out of ammo!")
