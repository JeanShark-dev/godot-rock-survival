extends Control


var mainNode

func _ready():
	mainNode = get_parent().get_parent().get_parent().get_parent()


func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		$PauseMenu.visible = !$PauseMenu.visible
		get_tree().paused = !get_tree().paused
	if Input.is_action_just_pressed("ui_tech"):
		$TechMenu.visible = !$TechMenu.visible


func _on_resume_button_pressed():
	$PauseMenu.visible = !$PauseMenu.visible
	get_tree().paused = !get_tree().paused


func _on_quit_button_pressed():
	mainNode.QUIT()
