extends ColorRect


var main_node


func _ready():
	main_node = get_parent().get_parent()


func _on_continue_button_pressed():
	pass # Replace with function body.


func _on_options_button_pressed():
	main_node.load_options_menu()


func _on_quit_to_menu_button_pressed():
	main_node.load_main_menu()


func _on_quit_game_button_pressed():
	main_node.QUIT()
