extends Label

@export var game_timer: Timer

func _process(delta: float) -> void:
	var timeleft = game_timer.get_time_left()
	self.text = "Time Left: " + "%1.0f" % timeleft
