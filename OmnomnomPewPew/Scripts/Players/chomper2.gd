extends CharacterBody2D
class_name Player2

var path_follow_offset = 0

@onready var path_follow: PathFollow2D = %PathFollow2D
@onready var path_2d: Path2D = %Path2D

var direction = 1

func _physics_process(delta): 
	var speed2 = Global.chomper_speed2
	path_follow.progress += speed2 * delta * direction
	
	# Check for the spacebar press to change direction
	if Input.is_action_just_pressed("ui_accept"):
		direction *= -1
	
func _ready():
	# Set the initial position at the beginning of the path
	path_follow.progress = 1
	
