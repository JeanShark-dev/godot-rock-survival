extends Control


var mainNode
func _ready():
	mainNode = get_parent().get_parent().get_parent().get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		$PauseMenu.visible = !$PauseMenu.visible


func _on_resume_button_pressed():
	$PauseMenu.visible = !$PauseMenu.visible


func _on_quit_button_pressed():
	mainNode.QUIT()
