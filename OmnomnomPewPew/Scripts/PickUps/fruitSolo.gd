extends Area2D

@onready var fruit: Label = %Fruit

func _on_body_entered(_body: Node2D) -> void:
	Global.fruits -= 1
	fruit.text = "Fruit: " + str(Global.fruits)
	queue_free()
	if Global.fruits == 0:
		get_tree().change_scene_to_file("res://Scenes/SoloLevels/SoloLVL2.tscn")
		Global.lives = 3
		Global.fruits = 20
