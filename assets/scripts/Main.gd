extends Node


var player = preload("res://player_container.tscn")
func _ready():
	pass # Replace with function body.


func _process(_delta):
	pass


func QUIT():
	print("Quitting...")
	get_tree().quit()


func START():
	print("Starting game...")
	var playerInstance = player.instantiate()
	$WorldContainer.add_child(playerInstance)
	$MainMenu.hide()


func _on_quit_button_pressed():
	QUIT()


func _on_start_button_pressed():
	START()
