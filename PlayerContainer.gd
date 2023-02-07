extends Node2D

var handPosition = Vector2()
var hpMax = 130
var apMax = 25
var ap
var hp
var recovering = false
onready var currentWeapon = $ProjectileContainer/WeaponContainer.get_child(0)
signal scoreAdd(scorePlus)
signal hpUpdate(HPValue, APValue)



func _ready():
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
	if Input.is_action_pressed("M1"):
		currentWeapon.Update($Node2D.get_local_mouse_position(), 10, $PlayerRBody.get_rid())
	if recovering == true:
		armorRecovery(delta)

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


func die():
	var parent = get_parent()
	parent.reset()

func _on_Main_scoreAdd(scorePlus):
	emit_signal("scoreAdd", scorePlus)


func _on_PlayerRBody_takingDamage(damageNum, damageSource):
	#print("OW! Took ", damageNum,  " damage from ", damageSource, "!")
	if damageSource != $PlayerRBody.get_rid():
		takeDamage(damageNum, damageSource)


func _on_ArmorTimer_timeout():
	recovering = true


func _on_ReloadTimer_timeout():
	pass # Replace with function body.
