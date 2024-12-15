extends Node2D

func _on_game_timer_timeout() -> void:
	if (Global.captain_score > Global.chomper_score):
		get_tree().change_scene_to_file("res://Scenes/Interfaces/captain_win.tscn")
	if (Global.chomper_score > Global.captain_score):
		get_tree().change_scene_to_file("res://Scenes/Interfaces/chomper_win.tscn")
