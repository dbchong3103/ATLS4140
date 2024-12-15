extends Area2D

@onready var fruit: Label = %Fruit

func _on_body_entered(_body: Node2D) -> void:
	Global.chomper_score += 50
	queue_free()
