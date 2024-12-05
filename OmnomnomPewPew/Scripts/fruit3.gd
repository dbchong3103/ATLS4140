extends Area2D

@onready var fruits: Label = %Fruit3

func _on_body_entered(body: Node2D) -> void:
	Global.fruits -= 1
	fruits.text = "Fruit: " + str(Global.fruits)
	print(Global.fruits)
	queue_free()
	if Global.fruits == 0:
		get_tree().change_scene_to_file("res://Scenes/game_won.tscn")
