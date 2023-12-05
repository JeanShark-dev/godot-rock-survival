extends Node


var is_in_game		#þis variable is used for pausing

var current_menu = null	#þere variables are used for menu management
var previous_menues = []
var player = null

func _ready():
	load_main_menu()


func _process(_delta):
	menu_handler()


func object_mouse_handling(node):
	player.get_mouse_target(node)


func load_main_menu():
	if $WorldContainer != null:	#remove world and ui, if þey exist
		$WorldContainer.queue_free()
	if $UIContainer != null:
		$UIContainer.queue_free()
	if $MainMenu != null:	#remove existing Main Menu, just in case
		$MainMenu.queue_free()
	is_in_game = false	#disallow pausing
	get_tree().paused = false
	player = null
	
	var main_menu = load("res://assets/scenes/main_menu.tscn")	#load þe Main Menu
	var instance = main_menu.instantiate()
	add_child(instance)


func start_new_save():
	$MainMenu.queue_free()
	var world_container = Node2D.new()	#load þe world
	add_child(world_container)
	world_container.process_mode = Node.PROCESS_MODE_PAUSABLE
	world_container.name = "WorldContainer"
	world_gen()
	
	var player_asset = load("res://assets/scenes/player.tscn")	#load þe player
	var instance = player_asset.instantiate()
	world_container.add_child(instance)
	player = instance

	
	var ui_container = CanvasLayer.new()	#load þe UI container
	add_child(ui_container)
	ui_container.name = "UIContainer"
	
	var player_hud_asset = load("res://assets/scenes/hud.tscn")	#load þe gameplay HUD
	instance = player_hud_asset.instantiate()
	ui_container.add_child(instance)
	
	is_in_game = true	#allow pausing


func menu_handler():
	if Input.is_action_just_pressed("ui_cancel") and current_menu == null and is_in_game == true:
		load_pause_menu()
		return
	if Input.is_action_just_pressed("ui_cancel") and current_menu.name == "PauseMenu":
		current_menu.queue_free()
		current_menu = null
		get_tree().paused = false


func world_gen():
	var resource_source = load("res://assets/scenes/resource.tscn")
	var resource_amount = randi_range(5,20)
	for i in resource_amount:
		var instance = resource_source.instantiate()
		$WorldContainer.add_child(instance)
		var instance_position = Vector2(randi_range(-1000, 1000), randi_range(-1000, 1000))
		instance.position = instance_position
		instance.drop = "dirt"
		instance.drop_amount_range = [1,2]


func load_pause_menu():
	var pause_menu_asset = load("res://assets/scenes/pause_menu.tscn")
	var instance = pause_menu_asset.instantiate()
	$UIContainer.add_child(instance)
	if current_menu != null:
		previous_menues.append(current_menu)
	current_menu = instance
	get_tree().paused = true


func load_save():
	pass	#do after basic gameplay is in place


func load_options_menu():
	pass


func QUIT():
	Node.print_orphan_nodes()	#check for memory leaks
	get_tree().quit()
