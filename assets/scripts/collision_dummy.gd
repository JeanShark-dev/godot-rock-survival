extends RigidBody2D



func _ready():
	self.add_to_group("mortal", true)

func _process(_delta):
	if Input.is_action_just_pressed("gp_use"):
		take_damage(1, " unexpected")

func take_damage(damageAmount, damageType):
	print("Dummy took ", damageAmount, damageType, " damage.")
