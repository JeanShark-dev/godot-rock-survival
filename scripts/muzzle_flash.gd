extends CPUParticles2D

func _ready() -> void:
	emitting = true
func _on_finished() -> void:
	queue_free()
