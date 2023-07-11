extends Node2D


@onready var ammoManager = get_parent().get_parent().get_parent().get_parent().get_parent()
@onready var player = get_parent().get_parent()
var type = "Flintlock"
var AmmoType = "Flintlock Bullet"
var ammo = preload("res://flintlock_bullet.tscn")
@export var spread = 0.0
@export var barrelLength = 0.0

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
	isChambered = false
	isCocked = false

	isReady = true
	var bullet = ammo.instantiate()
	ammoManager.add_child(bullet)
	bullet.position = player.global_position + get_local_mouse_position().normalized()*barrelLength
	#bullet.look_at(get_global_mouse_position())
	bullet.apply_central_impulse(get_local_mouse_position().normalized()*1000)
	
	$GunshotSound.play()

func _on_chamber_timer_timeout():
	isChambered = true
	isReady = true


func _on_cock_timer_timeout():
	isCocked = true
	isReady = true
