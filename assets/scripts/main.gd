extends Node

func _ready():
	load_main_menu()
	pass


func load_main_menu():
	print("Loading Main Menu...")
	if get_node("Main Menu") != null:
		print("Existing Main Menu found, removing...")
		$"Main Menu".queue_free()
	var main_menu = load("res://assets/scenes/main_menu.tscn")
	var instance = main_menu.instantiate()
	add_child(instance)
	print("Main Menu done.")
	
