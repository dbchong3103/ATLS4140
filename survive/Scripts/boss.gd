extends CharacterBody2D
class_name Boss

@export var player: CharacterBody2D
@export var pew: Resource
@export var timer: Timer


var attacking = false

func _physics_process(_delta):
	if (attacking == false):
		%BossAnimation.play("boss_idle")
	if Global.bossHealth <= 0:
		Global.score += 250
		queue_free()
	if Global.health <= 0:
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
#
func _on_slice_timer_timeout() -> void:
	var new_pew = pew.instantiate()
	get_parent().add_child(new_pew)
	var pew_go = position.direction_to(player.global_position)
	new_pew.look_at(player.global_position)
	new_pew.fire(pew_go, 500)
	new_pew.position = position
	attacking = false
	timer.start()

	
