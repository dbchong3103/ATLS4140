extends Label

@export var timer: Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.text = "Chomper Score: " + str(Global.chomper_score)
	
func _on_score_count_timeout() -> void:
	Global.chomper_score += 100
