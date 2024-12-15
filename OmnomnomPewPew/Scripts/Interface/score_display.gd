extends Label

func _process(delta: float) -> void:
	self.text = "Chomper: " + str(Global.chomper_score) + "      " + "Captain: " + str(Global.captain_score)
