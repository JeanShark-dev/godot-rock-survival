extends CharacterBody2D

@export var max_health = 5
@export var allegiance = "target"
@onready var current_health = max_health



func take_damage(damage_amount, damage_type, damage_effect = "none", damage_allegiance = "none"):
	if damage_allegiance != allegiance:
		#print("taking ", damage_amount, " damage of type ", damage_type, ", adding the debuff: ", damage_effect)
		take_hit()
		current_health -= damage_amount
		#print("remaining hp: ", current_health)
		death_check("damage")
	else:
		#print("friendly fire, ignoring")
		pass

func take_hit():
	#print("Target hit")
	pass

func death_check(death_source):
	if death_source == "instant_death":
		#print("Target obliteratrd")
		die()
	if current_health <= 0:
		#print("Target down")
		die()

func die():
	queue_free()
