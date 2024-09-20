extends CharacterBody2D

var fireball = preload("res://scenes/fireball.tscn")
var laser = preload("res://scenes/laser.tscn")
var spellbook = preload("res://scenes/spellbook.tscn")
@onready var timer: Timer = %Timer

@export var move_speed: float = 200.0

func _input(event):
	if (event is InputEventMouseButton):
		# Only shoot on left click pressed down
		if (event.button_index == 1 and event.is_pressed()):
			var new_fireball = fireball.instantiate()
			get_parent().add_child(new_fireball)
			
			var fireball_forward = position.direction_to(get_global_mouse_position())
			new_fireball.fire(fireball_forward, 1000.0)
			new_fireball.position = position
			
	else:
		if event is InputEventKey:
			if event.pressed and event.keycode == KEY_Q:
				var new_laser = laser.instantiate()
				add_child(new_laser)
				
				#var laser_forward = position.direction_to(get_global_mouse_position())
				new_laser.appear()
		
			if event.pressed and event.keycode == KEY_E:
				var new_spellbook = spellbook.instantiate()
				add_child(new_spellbook)
				
				var spellbook_forward = position.direction_to(get_local_mouse_position())
				new_spellbook.fire(spellbook_forward, 100)
				

func _physics_process(_delta):
	look_at(get_viewport().get_mouse_position())
	
	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down") * move_speed
	move_and_slide()
	
	## Math to sort out direction and animation
	#var angle = rad_to_deg(velocity.angle()) + 180
	#if (velocity.length() < 10):
		#$AnimationPlayer.play("idle_front")
	#else:
		#if (angle > 135 and angle < 225):
			#$AnimationPlayer.play("walk_right")
		#elif (angle > 225 and angle < 315):
			#$AnimationPlayer.play("walk_front")
		#elif (angle > 315 or angle < 45):
			#$AnimationPlayer.play("walk_left")
		#elif (angle > 45 and angle < 135):
			##$AnimationPlayer.play("walk_left")
			#print("fix walk up!")
