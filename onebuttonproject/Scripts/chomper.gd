extends CharacterBody2D

var speed = 100
var path_follow_offset = 0

@onready var path_follow: PathFollow2D = %PathFollow2D
@onready var path_2d: Path2D = %Path2D

var direction = 1

func _physics_process(delta): 
	# Move the character along the path
	path_follow.progress += speed * delta * direction
	
	# Rotate the character to face the path direction
	look_at(path_follow.global_position)
	
	# Check for the spacebar press to change direction
	if Input.is_action_just_pressed("ui_accept"):
		direction *= -1
	
	# Apply the movement
	move_and_slide()
	
	# Check if the character is within the screen boundaries
	var viewport_size = get_viewport_rect().size
	var character_pos = global_position
	
	# Keep the character within the screen boundaries
	character_pos.x = clamp(character_pos.x, 0, viewport_size.x)
	character_pos.y = clamp(character_pos.y, 0, viewport_size.y)
	global_position = character_pos

func _ready():
	# Set the initial position at the beginning of the path
	path_follow.progress = 1
	
	# Adjust the follow offset to position the character correctly on the path
	position = path_2d.curve.get_point_position(0) + Vector2(path_follow_offset, 0)
