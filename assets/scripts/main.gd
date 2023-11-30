extends Node


func _ready():
	load_main_menu()


func load_main_menu():
	if get_node("Main Menu") != null:	#remove existing Main Menu, just in case
		$"Main Menu".queue_free()
	
	var main_menu = load("res://assets/scenes/main_menu.tscn")
	var instance = main_menu.instantiate()
	add_child(instance)


func start_new_save():
	print("New Game!")
	$"Main Menu".queue_free()
	var world_container = Node2D.new()
	add_child(world_container)
	
	var player_asset = load("res://assets/scenes/player.tscn")
	var instance = player_asset.instantiate()
	world_container.add_child(instance)

func load_save():
	pass	#do after basic gameplay is in place


func load_options_menu():
	pass


func QUIT():
	print_orphan_nodes()	#check for memory leaks
	get_tree().quit()
