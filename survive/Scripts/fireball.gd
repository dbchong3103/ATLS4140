extends Area2D
class_name Fireball

var karen = preload("res://Scenes/karen.tscn")
var orc = preload("res://Scenes/orc.tscn")

var velocity: Vector2 = Vector2(0,0)

func fire(forward: Vector2, speed: float):
	velocity = forward * speed
	look_at(position + forward)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += velocity * delta
	
func _on_body_entered(body: Node2D) -> void:
	if body is Karen:
		Global.karenHealth -= Global.fireDmg
		queue_free()
	if body is Orc:
		Global.orcHealth -= Global.fireDmg
		queue_free()
	if body is Boss:
		Global.bossHealth -= Global.fireDmg
		queue_free()

func shoot_circle(center_position, projectile_scene, num_projectiles, radius):
	var angle_increment = 2 * PI / num_projectiles
	
	for i in range(num_projectiles):
		var angle = i * angle_increment
		var x = cos(angle) * radius
		var y = sin(angle) * radius
		var projectile_position = center_position + Vector2(x, y) 
		
		var new_projectile = projectile_scene.instance()
		add_child(new_projectile)
		new_projectile.position = projectile_position
		# Set projectile's movement direction based on the calculated vector
		new_projectile.move_and_slide(Vector2(x, y).normalized()) 

	
