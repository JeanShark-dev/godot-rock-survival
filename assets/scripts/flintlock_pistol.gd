extends Node2D


var type = "Flintlock"
var AmmoType = "Flintlock Bullet"
var ammo = preload("res://flintlock_bullet.tscn").instantiate()
@export var spread = 0.0
@export var barrelLength = 0.0

var isChambered = false
var isCocked = false

func Chamber():
	$ChamberSound.play()
	$ChamberTimer.start()


func Cock():
	$CockSound.play()
	$CockTimer.start()


func Shoot():
	isChambered = false
	isCocked = false


func _on_chamber_timer_timeout():
	isChambered = true


func _on_cock_timer_timeout():
	isCocked = true
