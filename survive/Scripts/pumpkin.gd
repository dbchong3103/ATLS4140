extends CharacterBody2D

@export var timer: Timer
@export var slice = Resource
@export var player: CharacterBody2D

var speed = 100

func _physics_process(_delta):
	position += (player.position - position)/speed

func _on_pew_timeout() -> void:
	var new_slice = slice.instantiate()
	get_parent().add_child(new_slice)
	var blast_go = position.direction_to(player.global_position)
	new_slice.look_at(player.global_position)
	new_slice.fire(blast_go, 325)
	new_slice.position = position
	timer.start()
	
