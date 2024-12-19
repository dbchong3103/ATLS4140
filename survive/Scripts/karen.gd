extends CharacterBody2D
class_name Karen

var player
var health = 350

@onready var spawner: Timer = $Spawner

func _ready() -> void:
	player = get_node("/root/main/Shooter")

	
func take_fire_damage():
	health -= Global.fireDmg

func take_boom_damage():
	health -= Global.explosionDmg
	
func take_zone_damage():
	health -= Global.zoneDmg

func _physics_process(_delta):
	position += (player.position - position).normalized() * Global.karenSpeed
	if health <= 0:
		Global.score += 100
		queue_free()

func _on_area_2d_body_entered(body: Player) -> void:
	Global.health -= Global.karenDamage
	if Global.health <= 0:
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
	queue_free()
	
func _on_spawner_timeout() -> void:
	health += 100
