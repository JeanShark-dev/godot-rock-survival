extends Control

@onready var playerManager = get_parent().get_parent()

func _on_continue_button_pressed() -> void:
	playerManager.pause_unpause()


func _on_options_button_pressed() -> void:
	pass # Replace with function body.


func _on_menu_button_pressed() -> void:
	playerManager.pause_unpause()
	playerManager.reset()


func _on_quit_button_pressed() -> void:
	playerManager.quit()
