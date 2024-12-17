extends Node2D

@onready var main: Node2D = $".."

var pumpkin_scene := preload("res://Scenes/pumpkin.tscn")
var spawn_points := []

func _ready():
	for i in get_children():
		if i is Marker2D:
			spawn_points.append(i)
			
func _on_timer_timeout() -> void:
	#pick random point
	var spawn = spawn_points[randi() % spawn_points.size()]
#spawn
	var pumpkin = pumpkin_scene.instantiate()
	pumpkin.position = spawn.position
	main.add_child(pumpkin)
