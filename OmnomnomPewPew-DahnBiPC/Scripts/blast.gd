extends Area2D

var velocity: Vector2 = Vector2(0,0)

func fire(forward: Vector2, speed: float):
	velocity = forward * speed
	look_at(position + forward)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += velocity * delta

func _on_body_entered(body: Chomper) -> void: 
	print("yay")
	Global.lives -= 1
	queue_free()
	if Global.lives == 0:
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")

func _on_timer_timeout() -> void:
	queue_free()
