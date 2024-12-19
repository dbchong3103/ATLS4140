extends Control

@export var score: Label

func _process(delta: float) -> void:
	score.text = "High Score: " + str(Global.score)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/howtoplay.tscn")

func _on_button_2_pressed() -> void:
	get_tree().quit()
