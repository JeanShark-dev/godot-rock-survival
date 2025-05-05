extends Node

@onready var Main_Menu = preload("res://scenes/main_menu.tscn")
@onready var world_container = preload("res://scenes/world_container.tscn")

func _ready() -> void:
	load_main_menu()

func load_main_menu():
	var new = Main_Menu.instantiate()
	add_child(new)

func load_world():
	var new = world_container.instantiate()
	add_child(new)

func purge():
	for child in get_children():
		child.queue_free()
	load_main_menu()
