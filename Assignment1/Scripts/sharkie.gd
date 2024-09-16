extends Area2D

@onready var timer = $Timer

func _on_body_entered(_body: CharacterBody2D) -> void:
	timer.start()
	Engine.time_scale = 3
	print("go")
	
	
func _on_timer_timeout() -> void:
	print("done")
	Engine.time_scale = 1
	queue_free()
