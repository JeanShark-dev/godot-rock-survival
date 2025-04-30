extends Node2D


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause_unpause()

func pause_unpause():
	get_tree().set_pause(!get_tree().is_paused())
	$CharacterBody2D/PauseMenu.visible = !$CharacterBody2D/PauseMenu.visible

func reset():
	get_parent().get_parent().purge()

func quit():
	get_tree().quit()
