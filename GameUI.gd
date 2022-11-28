extends Control


# Declare member variables here. Examples:



# Called when the node enters the scene tree for the first time.
func _ready():
	var missionTimeText = "Mission Time : %s "
	var missionTime = 0
	var missionTimeTextTrue = missionTimeText % str(missionTime)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	missionTime += 1
	missionTimeText = "Mission Time : "
	$Label.text = missionTimeText
