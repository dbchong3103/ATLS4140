extends Control


func _on_p_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MultiplayerLVLs/LVL1.tscn")

func _on_p_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MultiplayerLVLs/LVL2.tscn")

func _on_p_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MultiplayerLVLs/LVL3.tscn")
