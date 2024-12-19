extends Label

@export var game_timer: Timer

func _process(delta: float) -> void:
	var initialTime = game_timer.wait_time
	var timeleft = game_timer.get_time_left()
	var elapsedTime = initialTime - timeleft
	self.text = "Time: " + "%1.0f" % elapsedTime
