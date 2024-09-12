extends Area2D

func _on_body_entered(_body: CharacterBody2D) -> void:
	print("ded")
	get_tree().reload_current_scene()
