extends Enemy
class_name Orc

func _physics_process(_delta):
	position += (player.position - position).normalized() * Global.orcSpeed
	if Global.orcHealth <= 0:
		Global.score += 100
		queue_free()
	if position.distance_to(player.position) > 50:
		Global.orcSpeed = 2
		%OrcAnimation.play("orc_run")
	if position.distance_to(player.position) < 50:
		Global.orcSpeed = 0
		%OrcAnimation.play("orc_attack")
		
func _on_axe_body_entered(body: Player) -> void:
	Global.health -= Global.orcDamage
	print(Global.health)
	if Global.health <= 0:
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
