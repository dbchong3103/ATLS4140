extends Label

func _process(delta: float) -> void:
	self.text = "Health: " + str(Global.health)
