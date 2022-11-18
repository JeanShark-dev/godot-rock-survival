extends Node2D


# Declare member variables here. Examples:
var num = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	while num > 0:
		var boulder = load("ContextObstacle.tscn").instance()
		$WorldContainer.add_child(boulder)
		boulder.position = Vector2(randi()%1000 -500, randi()%1000 -500)
		num -= 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
