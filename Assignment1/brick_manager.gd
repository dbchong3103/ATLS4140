extends Node2D

var brick = preload("res://scenes/brick.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var width = get_viewport_rect().size.x
	var height = get_viewport_rect().size.y / 1/2
	for i in 5:
		for j in 5:
			var newBrick = brick.instantiate()
			newBrick.position = Vector2(width / 5 * i, height / 5 * j)
			add_child(newBrick)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
