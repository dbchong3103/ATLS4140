extends CharacterBody2D
class_name Player

@export var fireball: Resource
@export var qSkill: Resource
@export var rSkill: Resource
@onready var walking: AudioStreamPlayer2D = $walking

@export var move_speed: float = 200.0

@export var qSkill_timer: Timer
@export var eSkill_timer: Timer
@export var eCooldown: Timer
@export var rSkill_timer: Timer

@export var game_timer: Timer
@export_range(0,2*PI) var alpha: float = 0.0

var qGo = true
var eGo = true
var rGo = true
var theta: float = 0.0

func _input(event):
	if (event is InputEventMouseButton):
		# Only shoot on left sck pressed down
		if (event.button_index == 1 and event.is_pressed()):
			var new_fireball = fireball.instantiate()
			get_parent().add_child(new_fireball)
			
			var projectile_forward = position.direction_to(get_global_mouse_position())
			new_fireball.fire(projectile_forward, 750.0)
			new_fireball.position = position
	if (event is InputEventKey):
		if (event.is_pressed() and event.keycode == KEY_Q and qGo == true):
			qGo = false
			var new_q = qSkill.instantiate()
			get_parent().add_child(new_q)
			var q_forward = position.direction_to(get_global_mouse_position())
			new_q.fire(q_forward, 100.0)
			new_q.position = position
			qSkill_timer.start()
			
		if (event.is_pressed() and event.keycode == KEY_E and eGo == true):
			eGo = false
			%CollisionShape2D.disabled = false
			%AnimatedSprite2D.visible = true
			%PlayerBody.disabled = true
			eSkill_timer.start()
		
		if (event.is_pressed() and event.keycode == KEY_R and rGo == true):
			rGo = false
			var new_r = rSkill.instantiate()
			get_parent().add_child(new_r)
			var r_forward = position.direction_to(get_global_mouse_position())
			new_r.fire(r_forward, 300.0)
			new_r.position = position
			rSkill_timer.start()
			

func shoot(angle):
	var bullet = rSkill.instantiate()
 
	bullet.position = global_position
	
	get_tree().current_scene.call_deferred("add_child",bullet)
	
func _on_r_skill_timeout() -> void:
	rGo = true

func _on_q_skill_timeout() -> void:
	qGo = true

func _on_e_skill_timeout() -> void:
	%CollisionShape2D.disabled = true
	%AnimatedSprite2D.visible = false
	%PlayerBody.disabled = false
	eCooldown.start()

func _on_e_cooldown_timeout() -> void:
	eGo = true

func _physics_process(delta):
	velocity = Input.get_vector("move_left","move_right","move_up","move_down") * move_speed
	move_and_slide()
	
	# Math to sort out direction and animation
	var angle = rad_to_deg(velocity.angle()) + 180
	if (velocity.length() < 10):
		%Idle.play("idle_front")
		$Player.visible = false
		$Idle.visible = true
	else:
		#walking.play()
		$Player.visible = true
		$Idle.visible = false
		if (angle > 0 and angle < 60):
			%Walking.play("left_up")
		elif (angle > 300 and angle < 360):
			%Walking.play("left_down")
		elif (angle > 240 and angle < 300):
			%Walking.play("forward")
		elif (angle > 180 and angle < 240):
			%Walking.play("right down")
		elif (angle > 120 and angle < 180):
			%Walking.play("right_up")
		elif (angle > 60 or angle < 120):
			%Walking.play("up")
			
