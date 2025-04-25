extends Node2D

var player_container_resource = load("res://player_container.tscn")

func spawn_player():
	var player = player_container_resource.instantiate()
	add_child(player)

func _ready() -> void:
	spawn_player()
