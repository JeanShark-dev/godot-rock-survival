extends Node2D

@export var spawn_position: Vector2
@export var faction: String
@export var vision_range: float = 1000

func _ready() -> void:
	$EnemyBody.position = spawn_position
	$EnemyBody.add_to_group(faction)
	$EnemyBody/Vision/CollisionShape2D.shape.radius = vision_range

func _process(delta: float) -> void:
	pass
