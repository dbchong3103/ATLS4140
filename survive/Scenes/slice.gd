extends Area2D

var velocity: Vector2 = Vector2(0,0)

func fire(forward: Vector2, speed: float):
	velocity = forward * speed
	look_at(position + forward)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += velocity * delta
	
func _on_body_entered(body: Node2D) -> void:
	if body is Karen:
		if body.has_method("take_zone_damage") == true:
			body.take_zone_damage()
		
	if body is Orc:
		if body.has_method("take_zone_damage") == true:
			body.take_zone_damage()
		
	if body is Boss:
		if body.has_method("take_zone_damage") == true:
			body.take_zone_damage()
		
