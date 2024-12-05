extends Control

func _on_start_pressed() -> void:
	Global.fruits = 10
	Global.lives = 3
	get_tree().change_scene_to_file("res://Scenes/LVL1.tscn")


func _on_quit_game_pressed() -> void:
	get_tree().quit()
