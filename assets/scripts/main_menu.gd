extends MarginContainer


var main_node


func _ready():
	main_node = get_parent()


func _on_new_game_button_pressed():
	main_node.start_new_save()


func _on_continue_button_pressed():
	main_node.load_save()


func _on_options_button_pressed():
	main_node.load_options_menu()


func _on_quit_button_pressed():
	main_node.QUIT()


