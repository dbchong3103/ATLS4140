extends Area2D

@onready var timer: Timer = $Timer
var velocity: Vector2 = Vector2(0,0)
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func fire(forward: Vector2, speed: float):
		velocity = forward * speed
		look_at(position + forward)
		timer.start()
		print("timer")
		animation_player.play("spellbook")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += velocity * delta

func _on_time_to_live_timeout():
	queue_free()


func _on_timer_timeout() -> void:
	animation_player.play("boom")
	print("end")
	queue_free()
