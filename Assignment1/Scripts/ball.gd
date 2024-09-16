extends CharacterBody2D

@export var speed: float = 200.0
@export var max_speed: float = 1000.0
@onready var score_text: RichTextLabel = %ScoreText


const PADDLE_WIDTH = 122.00
const WIDTH = 1150
const HEIGHT = 648

var forward = Vector2(1,1).normalized()
var current_score: int = 0

var is_running: bool = false
var ball2_exist: bool = false

var ball2 = preload("res://scenes/ball2.tscn")
var GameOver = preload("res://scenes/game_over_screen.tscn")


func _ready() -> void:
	var score_text: RichTextLabel = %ScoreText
	print(score_text)
	pass

func _physics_process(delta: float) -> void:
	if (not is_running):
			is_running = true
			visible = true
#
		#return
	
	var collision: KinematicCollision2D = move_and_collide(forward * speed * delta)
	
	if (collision):
		forward = forward.bounce(collision.get_normal())
		speed = clamp(speed + 5, 1, max_speed)
		print(speed)
		
		if (collision.get_collider().is_in_group("Bricks")):
			collision.get_collider().queue_free()
			current_score += 10
			print(current_score)
			score_text.text = "SCORE: " + str(current_score)

		 #Paddle bounce should be based on ball position
		if (collision.get_collider().is_in_group("Paddle")):
			forward = forward.rotated(collision.get_normal().angle_to(forward)/4)
			print(forward)
			
		if (collision.get_collider().is_in_group("DoublePower")) and ball2_exist == false:
			var newBall = ball2.instantiate()
			newBall.position = Vector2(0,0)
			add_child(newBall)
			print("new")
			ball2_exist = true
			
		#Handle game over conditions
		if (collision.get_collider().is_in_group("GameOver")):
			is_running = false
			var gameEnd = GameOver.instantiate()
			add_child(gameEnd)
			get_tree().paused = true


#func _on_slow_mo_timeout() -> void:
	#Engine.time_scale = 1
