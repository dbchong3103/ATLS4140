extends Area2D
class_name ShipBuff

var path_follow_offset = 0

@onready var path_follow: PathFollow2D = %ButtPathFollow
@onready var path_2d: Path2D = %BuffPath
@onready var timer: Timer = $BuffTime
@export var cooldown: Timer

var direction = 1

func _physics_process(delta): 
		var speed = Global.shipSpeed1
		path_follow.progress += speed * delta * direction

func _on_body_entered(body: Node2D) -> void:
	timer.start()
	print("SPEED")
	cooldown.wait_time = 0.1
	
func _ready():
	# Set the initial position at the beginning of the path
	path_follow.progress = 1

func _on_buff_time_timeout() -> void:
	cooldown.wait_time = 0.3
	print("slow..")
	queue_free()
