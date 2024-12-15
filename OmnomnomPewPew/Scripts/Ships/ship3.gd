extends CharacterBody2D

@export var chomper: CharacterBody2D
@export var timer: Timer
@export var blast_scene = Resource
@export var firedelay: float = 1

var can_attack = true

func _ready():
	timer.wait_time = firedelay
	
func _physics_process(_delta):
	look_at(chomper.global_position)

func _on_cooldown_timeout() -> void:
	can_attack = true
	print("attack yes")
		
func _input(event: InputEvent) -> void:
	if (event is InputEventMouseButton):
		if (event.button_index == 1 and event.is_pressed and can_attack == true):
			can_attack = false
			var new_blast = blast_scene.instantiate()
			get_parent().add_child(new_blast)
			var blast_go = position.direction_to(get_global_mouse_position())
			new_blast.fire(blast_go, 450)
			new_blast.position = position
			timer.start()
