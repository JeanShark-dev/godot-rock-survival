extends Panel

@onready var item_sprite:TextureRect = $CenterContainer/Display

func update(item: InvItem):
	if !item:
		item_sprite.visible = false
	else:
		item_sprite.visible = true
		item_sprite.texture = item.sprite
