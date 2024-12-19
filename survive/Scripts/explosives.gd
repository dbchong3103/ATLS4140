extends Area2D

var velocity: Vector2 = Vector2(0,0)
@export var timer: Timer
var karen = preload("res://Scenes/karen.tscn")
var orc = preload("res://Scenes/orc.tscn")

func fire(forward: Vector2, speed: float):
	velocity = forward * speed
	look_at(position + forward)
	#%Animation_player.play("explode")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += velocity * delta

func _on_body_entered(body: Node2D) -> void:
	if body is Karen:
		Global.karenHealth -= Global.explosionDmg
	if body is Orc:
		Global.orcHealth -= Global.explosionDmg
	if body is Boss:
		Global.bossHealth -= Global.explosionDmg
		print(Global.bossHealth)
	queue_free()


	
		
