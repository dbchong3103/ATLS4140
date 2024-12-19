extends Control

@export var score_label: Label

func _ready() -> void:
	score_label.text = "High Score: " + str(Global.score)

func _on_button_pressed() -> void:
	
	Global.health = 100

	Global.charSpeed = 500
	Global.orcSpeed = 3
	Global.karenSpeed = 4

	Global.orcHealth = 500
	Global.bossHealth = 1000
	Global.karenHealth = 350

	Global.orcDamage = 15
	Global.bossDamage = 25
	Global.karenDamage = 20

	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_button_2_pressed() -> void:
	get_tree().quit()