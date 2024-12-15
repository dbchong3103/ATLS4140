extends Control


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Interfaces/map_explanation.tscn")
	
func _on_quit_game_pressed() -> void:
	get_tree().quit()

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Interfaces/single_player.tscn")
