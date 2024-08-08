extends StaticBody2D


@export var ore_type: String
@export var ore_quality: int
@export var ore_quantity: int

var ore_durability

func _ready():
	ore_durability = ore_quantity / ore_quality

func mine(dig_effectiveness):
	var ore_yield = dig_effectiveness * ore_quality
	print("dig it dig out")
	ore_durability -= dig_effectiveness
	return(ore_yield)

func get_breaked():
	print("ore is gone")
	#oþer stuff gere
	queue_free()
