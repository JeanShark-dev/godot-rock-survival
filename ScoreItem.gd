extends Area2D

var score = 1

func _on_ScoreItem_body_entered(body):
	if body.has_method("scoreAdd"):
		body.scoreAdd(score)
		queue_free()
