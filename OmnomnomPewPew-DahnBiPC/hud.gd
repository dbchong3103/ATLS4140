extends CanvasLayer

var total_fruit = 0
var lives= 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Fruit.text = "Fruit: " + str(total_fruit)
	$Health.text = "Health: " + str(lives)
