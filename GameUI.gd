extends Control


# Declare member variables here. Examples:
var missionTime = 0
var missionTimeText = "Mission Time : %s "
var missionTimeTextTrue = missionTimeText % str(missionTime)
var score = 0
var scoreText = "Score : %s"
var scoreTextTrue = scoreText % score
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_Timer_timeout():
	missionTime += 1
	missionTimeTextTrue = missionTimeText % str(missionTime)
	$VBoxContainer/Label.text = missionTimeTextTrue


func _on_PlayerContainer_scoreAdd(scorePlus):
	score += scorePlus
	scoreTextTrue = scoreText % score
	$VBoxContainer/Label2.text = scoreTextTrue
