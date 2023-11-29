extends Node2D


@onready var ammoManager = get_parent().get_parent().get_parent().get_parent().get_parent()
@onready var player = get_parent().get_parent().get_parent()
@export var type = "Flintlock"
@export var AmmoType = "Flintlock Bullet"
@export var ammo = preload("res://flintlock_bullet.tscn")
@export var sprite = preload("res://assets/sprites/weapons/flintlock-pistol.svg")
@export var spread = 0.0
@export var barrelLength = 0.0
@export var effectiveRange = 0.0

var weapon = "res://flintlock_pistol.tscn"

var isChambered = false
var isCocked = false
var isReady = true


func _process(_delta):
	if Input.is_action_just_pressed("mouse0") && isReady:
		if isChambered && isCocked:
			Shoot()
			return
		if !isChambered:
			Chamber()
			return
		if !isCocked:
			Cock()
			return


func Chamber():
	$ChamberSound.play()
	$ChamberTimer.start()
	isReady = false


func Cock():
	$CockSound.play()
	$CockTimer.start()
	isReady = false


func Shoot():
#	print("Shoot!")
	isChambered = false
	isCocked = false
	$ShotTimer.start()

	var bullet = ammo.instantiate()
	ammoManager.add_child(bullet)
	bullet.position = player.position + get_local_mouse_position().normalized() * barrelLength
	bullet.look_at(get_global_mouse_position())
#	bullet.position += get_local_mouse_position().normalized() * barrelLength
	bullet.target_position = Vector2(effectiveRange,0)
#	bullet.get_node("Line2D").add_point(bullet.target_position)
	
	$GunshotSound.play()


func _on_chamber_timer_timeout():
#	print("Loaded.")
	isChambered = true
	isReady = true


func _on_cock_timer_timeout():
#	print("Locked.")
	isCocked = true
	isReady = true


func _on_shot_timer_timeout():
#	print("Can shoot.")
	isReady = true
