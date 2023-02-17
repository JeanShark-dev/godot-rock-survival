extends "res://DefaultProjectile.gd"


var speed = 1
var initialSpeed = 1
onready var initialDamage = damage
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	speed = (abs(linear_velocity.x)+abs(linear_velocity.y))/2
	damage = initialDamage * (speed/initialSpeed)
	clamp(damage, 0, initialDamage)

func _on_FalloffTimer_timeout():
	initialSpeed = (abs(linear_velocity.x)+abs(linear_velocity.y))/2
	$Particles2D.one_shot = true
