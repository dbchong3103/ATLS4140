extends Area2D

var velocity: Vector2 = Vector2(0,0)

func fire(forward: Vector2, speed: float):
	velocity = forward * speed
	look_at(position + forward)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += velocity * delta

func _on_body_entered(body: Player2) -> void: 
	Global.captain_score += 100
	queue_free()


func _on_timer_timeout() -> void:
	queue_free()
