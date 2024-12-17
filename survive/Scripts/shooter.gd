extends CharacterBody2D

@export var fireball: Resource
@export var qSkill: Resource
@export var eSkill: Resource

@export var move_speed: float = 200.0

@export var qSkill_timer: Timer
@export var eSkill_timer: Timer

@export var game_timer: Timer


func _input(event):
	if (event is InputEventMouseButton):
		# Only shoot on left click pressed down
		if (event.button_index == 1 and event.is_pressed()):
			var new_fireball = fireball.instantiate()
			get_parent().add_child(new_fireball)
			
			var projectile_forward = position.direction_to(get_global_mouse_position())
			new_fireball.fire(projectile_forward, 750.0)
			new_fireball.position = position
	#if (event is InputEventKey):
		#if (event.is_pressed() and event.keycode == KEY_Q):
			#var new_q = qSkill.instantiate()
			#get_parent().add_child(new_q)
		#
		#var q_forward = 
		
func _physics_process(delta):
	# Aiming logic
	#$Weapon.rotation = position.direction_to(get_global_mouse_position()).angle()
	#$Weapon/Sprite2D.flip_v = ($Weapon.rotation < -PI/2 or $Weapon.rotation > PI/2)
	
	velocity = Input.get_vector("move_left","move_right","move_up","move_down") * move_speed
	move_and_slide()
	
	# Math to sort out direction and animation
	var angle = rad_to_deg(velocity.angle()) + 180
	if (velocity.length() < 10):
		%Idle.play("idle_front")
		$Player.visible = false
		$Idle.visible = true
	else:
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
			
