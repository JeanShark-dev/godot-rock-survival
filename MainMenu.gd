extends Control


signal GameStart()
signal OptionsStart()
signal QuitGame()

func _on_GameStartButton_button_down():
	emit_signal("GameStart")


func _on_OptionsButton_button_down():
	emit_signal("OptionsStart")


func _on_QuitButton_button_down():
	emit_signal("QuitGame")

