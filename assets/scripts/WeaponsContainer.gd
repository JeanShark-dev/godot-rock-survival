extends Area2D


var pickupCandidate


func _process(delta):
	pass



func _on_area_entered(area):
	print("area found")
	if area.has_method("toolTipShow"):
		print("area is pickuppable")
		candidateHide()
		pickupCandidate = area
		candidateShow()

func candidateShow():
	print("candidate show")
	if pickupCandidate.has_method("toolTipShow"):
		pickupCandidate.toolTipShow()

func candidateHide():
	print("candidate hide")
	if pickupCandidate.has_method("toolTipHide"):
		pickupCandidate.toolTipHide()
