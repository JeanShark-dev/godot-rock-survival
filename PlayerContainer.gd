extends Node2D

var handPosition = Vector2()
var hpMax = 130
var apMax = 25
var ap
var hp
signal scoreAdd(scorePlus)

func _ready():
	$Node2D/GameUI.rect_size = OS.window_size
	$Node2D/GameUI.rect_position = -OS.window_size/2
	var parent = get_parent()
	parent.connect("scoreAdd", self, "_on_Main_scoreAdd")
	parent.emit_signal("scoreAdd", 0)
	hp = hpMax
	ap = apMax

func _process(_delta):
	handPosition = get_node("PlayerRBody").position
	get_node("ProjectileContainer/Gun9mm").set_position(handPosition)
	if Input.is_action_just_pressed("DEBUG1"):
		takeDamage(10)

func takeDamage(damageNum):
	if ap > 0:
		if damageNum > ap:
			damageNum -= ap
			ap -= ap
		else:
			ap -= damageNum
			damageNum -= damageNum
	hp -= damageNum
	print (ap, ", ", hp)
	if hp <= 0:
		die()

func die():
	var parent = get_parent()
	parent.reset()

func _on_Main_scoreAdd(scorePlus):
	emit_signal("scoreAdd", scorePlus)


func _on_PlayerRBody_takingDamage(damageNum, damageSource):
	if damageSource != "Player":
		takeDamage(damageNum)
