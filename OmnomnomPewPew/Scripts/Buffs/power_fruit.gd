extends Area2D

@onready var timer: Timer = %BuffTimer

func _on_body_entered(body: Node2D) -> void:
	timer.start()
	Global.chomper_speed2 = 700
	Global.chomper_speed1 = 350
	Global.chomper_speed3 = 1000

func _on_buff_timer_timeout() -> void:
	print("over")
	Global.chomper_speed2 = 350
	Global.chomper_speed1 = 250
	Global.chomper_speed3 = 650
	queue_free()
	
