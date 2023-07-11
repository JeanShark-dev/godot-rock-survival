extends Area2D


var pickupCandidate


func _process(delta):
	if Input.is_action_just_pressed("gp_use")  && pickupCandidate != null:
		pickWeapon(pickupCandidate)


func pickWeapon(weapon):
	if weapon.is_in_group("weaponPickup") && $WeaponSlot.get_child_count() ==0:
		$WeaponSlot.add_child(weapon.weapon)
		weapon.queue_free()

func _on_area_entered(area):
	if pickupCandidate == null:
		pickupCandidate = area
	if area.is_in_group("weaponPickup"):
		candidateHide()
		pickupCandidate = area
		candidateShow()

func candidateShow():
	if pickupCandidate.is_in_group("weaponPickup") && pickupCandidate != null:
		pickupCandidate.toolTipShow()

func candidateHide():
	if pickupCandidate.is_in_group("weaponPickup") && pickupCandidate != null:
		pickupCandidate.toolTipHide()


func _on_area_exited(area):
	if area.is_in_group("weaponPickup") && pickupCandidate != null:
		pickupCandidate.toolTipHide()
		pickupCandidate = null
