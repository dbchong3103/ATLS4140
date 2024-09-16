extends CharacterBody2D

@export var speed: float = 200.0
@export var max_speed: float = 1000.0
@onready var bonus_text: RichTextLabel = %BonusText


var forward = Vector2(1,1).normalized()
var current_score: int = 0
const PADDLE_WIDTH = 120.00
var is_running: bool = false
var ball2_exist: bool = false
const WIDTH = 1150
const HEIGHT = 648
var ball2 = preload("res://scenes/ball2.tscn")
var game = preload("res://scenes/game.tscn")

	
func _physics_process(delta: float) -> void:
	#if (not is_running):
		#if (Input.is_action_just_pressed("click_window")):
			#is_running = true
			#start_text.visible = false
			#visible = true
#
		#return
	print(bonus_text)
	var collision: KinematicCollision2D = move_and_collide(forward * speed * delta)
	
	if (collision):
		forward = forward.bounce(collision.get_normal())
		speed = clamp(speed + 0.5, 1, max_speed)
		
		if (collision.get_collider().is_in_group("Bricks")):
			game.instantiate(PackedScene.GEN_EDIT_STATE_MAIN_INHERITED)
			collision.get_collider().queue_free()
			current_score += 20
			bonus_text.text = "BONUS: " + str(current_score)
	
