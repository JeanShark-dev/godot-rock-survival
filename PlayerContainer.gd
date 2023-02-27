extends Node2D

var handPosition = Vector2()
var hpMax = 130
var apMax = 25
var ap
var hp
var recovering = false
var currentWeapon
var weaponIndex = 0
signal scoreAdd(scorePlus)
signal hpUpdate(HPValue, APValue)
signal ammoUpdate(magAmmo, mags, backupAmmo)



func _ready():
	currentWeapon = $WeaponSlot.get_child(0)
	currentWeapon.isCurrentWeapon = true
	$Node2D/GameUI.rect_size = OS.window_size
	$Node2D/GameUI.rect_position = -OS.window_size/2
	var parent = get_parent()
	parent.connect("scoreAdd", self, "_on_Main_scoreAdd")
	parent.emit_signal("scoreAdd", 0)
	emit_signal("hpUpdate", str(hpMax), str(apMax))
	hp = hpMax
	ap = apMax


func _process(delta):
	currentWeapon.set_position($PlayerRBody.position)
	if Input.is_action_just_pressed("gp_tab"):
		swapWeapon()
	if Input.is_action_just_pressed("DEBUG1"):
		hp += 10
		emit_signal("hpUpdate", str(ceil(hp)), str(ceil(ap)))
	if Input.is_action_pressed("M1"):
		currentWeapon.Update($Node2D.get_local_mouse_position(), 1, $PlayerRBody.get_rid())
#		print("Fire command given.")
	if recovering == true:
		armorRecovery(delta)
	if hp > hpMax:
		reduceOverheal(delta)
	

func takeDamage(damageNum, damageSource):
	if damageSource == $PlayerRBody.get_rid():
		return
	recovering = false
	if ap > 0:
		if damageNum > ap:
			damageNum -= ap
			ap -= ap
		else:
			ap -= damageNum
			damageNum -= damageNum
	hp -= damageNum
	emit_signal("hpUpdate", str(ceil(hp)), str(ceil(ap)))
	#print (ap, ", ", hp)
	if hp <= 0:
		die()
	$ArmorTimer.start()


func armorRecovery(delta):
	emit_signal("hpUpdate", str(ceil(hp)), str(ceil(ap)))
	if ap <= apMax:
		ap += apMax/10 * delta
	if ap >= apMax:
		ap = apMax
		recovering = false


func reduceOverheal(delta):
	emit_signal("hpUpdate", str(ceil(hp)), str(ceil(ap)))
	hp -= 10 * delta
	if hp < hpMax:
		hp = ceil(hp)


func die():
	var parent = get_parent()
	parent.reset()


func swapWeapon():
	currentWeapon.isCurrentWeapon = false
	var weaponsCount = $WeaponsInventory.get_child_count()
	weaponIndex += 1
	if weaponIndex > weaponsCount - 1:
		weaponIndex = 0
	var newWeapon = $WeaponsInventory.get_child(weaponIndex)
	$WeaponSlot.remove_child(currentWeapon)
	$WeaponsInventory.remove_child(newWeapon)
	$WeaponsInventory.add_child(currentWeapon)
	$WeaponSlot.add_child(newWeapon)
	currentWeapon = newWeapon
	currentWeapon.isCurrentWeapon = true
	

func _on_Main_scoreAdd(scorePlus):
	emit_signal("scoreAdd", scorePlus)


func _on_Weapon_ammoUpdate(magAmmo, mags, backupAmmo):
	print(magAmmo, mags, backupAmmo)


func _on_PlayerRBody_takingDamage(damageNum, damageSource):
	#print("OW! Took ", damageNum,  " damage from ", damageSource, "!")
	if damageSource != $PlayerRBody.get_rid():
		takeDamage(damageNum, damageSource)


func _on_ArmorTimer_timeout():
	recovering = true


func _on_ReloadTimer_timeout():
	pass # Replace with function body.
