extends Control

var is_open = false

@onready var inventory: Inv = preload("res://assets/inventory/player_inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()


func _ready():
	update_slots()
	close()


func update_slots():
	for i in range(min(inventory.items.size(), slots.size())):
		slots[i].update(inventory.items[i])


func _process(_delta):
	if Input.is_action_just_pressed("inventory"):
		if is_open:
			close()
		else:
			open()


func open():
	visible = true
	is_open = true


func close():
	visible = false
	is_open = false
