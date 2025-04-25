extends Control



func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_start_button_pressed() -> void:
	get_parent().load_world()
	self.queue_free()
