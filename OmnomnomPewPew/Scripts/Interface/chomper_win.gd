extends Control

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Interfaces/title_screen.tscn")
	
func _on_quit_game_pressed() -> void:
	get_tree().quit()
