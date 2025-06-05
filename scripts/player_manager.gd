extends Node2D


@export var max_health = 100.0

@onready var current_health = max_health

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause_unpause()
	
	# FOR TESTING PURPOSES
	if Input.is_action_just_pressed("interact_generic"):
		gasp_for_breath()
	# FOR TESTING PURPOSES
	

# FOR TESTING PURPOSES
func gasp_for_breath():
	take_damage(10, "asphyxiation")
# FOR TESTING PURPOSES


func pause_unpause():
	get_tree().set_pause(!get_tree().is_paused())
	$CharacterBody2D/PauseMenu.visible = !$CharacterBody2D/PauseMenu.visible

func take_damage(damage_amount, damage_type, damage_effect = "none"):
	print("taking ", damage_amount, " damage of type ", damage_type, ", adding the debuff: ", damage_effect)
	take_hit()
	current_health -= damage_amount
	print("remaining hp: ", current_health)
	death_check("damage")

func take_hit():
	print("agh")

func death_check(death_source):
	if death_source == "instant_death":
		print("augh")
		die()
	if current_health <= 0:
		print("I am dead, not big souprice")
		die()

func die():
	quit()

func reset():
	get_parent().get_parent().purge()

func quit():
	get_tree().quit()
