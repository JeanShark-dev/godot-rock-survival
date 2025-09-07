extends Area2D

var in_vision_array: Array

func _on_body_entered(body: Node2D) -> void:
	in_vision_array.append(body)

func _on_body_exited(body: Node2D) -> void:
	in_vision_array.erase(body)
