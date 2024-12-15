extends CharacterBody2D

@export var chomper: CharacterBody2D
@export var timer: Timer
@export var blast_scene = Resource

var pews = 3

#have plane look at chomper
func _physics_process(_delta):
	look_at(chomper.global_position)

func _on_cooldown_timeout() -> void:
	var new_blast = blast_scene.instantiate()
	get_parent().add_child(new_blast)
	var blast_go = position.direction_to(chomper.global_position)
	new_blast.look_at(chomper.global_position)
	new_blast.fire(blast_go, 325)
	new_blast.position = position
	timer.start()
