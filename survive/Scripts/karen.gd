extends CharacterBody2D
class_name Karen

@export var player: CharacterBody2D

func _physics_process(_delta):
	position += (player.position - position).normalized() * Global.karenSpeed
	if Global.karenHealth <= 0:
		Global.score += 50
		queue_free()

func _on_area_2d_body_entered(body: Player) -> void:
	Global.health -= Global.karenDamage
	print(Global.health)
	if Global.health <= 0:
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
	queue_free()
