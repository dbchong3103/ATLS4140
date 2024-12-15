extends CharacterBody2D

@export var chomper: CharacterBody2D
@export var timer: Timer
@export var blast_scene = Resource

var pews = 3

#have plane look at chomper
func _physics_process(_delta):
	look_at(chomper.global_position)

#Makes ship shoot every 5 seconds, for level one at least
func _on_shooting_timeout() -> void:
	var new_blast = blast_scene.instantiate()
	get_parent().add_child(new_blast)
	var blast_go = position.direction_to(chomper.global_position)
	new_blast.fire(blast_go, 250)
	new_blast.position = position
	timer.start()
