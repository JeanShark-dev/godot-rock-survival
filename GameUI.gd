extends Control


# Declare member variables here. Examples:
var missionTime = 0
var missionTimeText = "Mission Time : %s "
var missionTimeTextTrue = missionTimeText % str(missionTime)
var score = 0
var scoreText = "Score : %s"
var scoreTextTrue = scoreText % score

var main
# Called when the node enters the scene tree for the first time.
func _ready():
	main = get_parent().get_parent().get_parent()
	#print(main)

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		$PauseMenu.visible = !$PauseMenu.visible

func _on_Timer_timeout():
	missionTime += 1
	missionTimeTextTrue = missionTimeText % str(missionTime)
	$GameplayUI/StatLabels/MissionTime.text = missionTimeTextTrue


func _on_PlayerContainer_scoreAdd(scorePlus):
	score += scorePlus
	scoreTextTrue = scoreText % score
	$GameplayUI/StatLabels/Score.text = scoreTextTrue

func _on_PlayerContainer_hpUpdate(HPValue, APValue):
	$"GameplayUI/StatLabels/Healþ".text = HPValue
	$GameplayUI/StatLabels/Shield.text = APValue


func _on_ResumeButton_button_down():
	$PauseMenu.visible = false


func _on_OptionsButton_button_down():
	pass # Replace with function body.


func _on_MainMenuButton_button_down():
	main.reset()


func _on_QuitButton_button_down():
	main.quitGame()
