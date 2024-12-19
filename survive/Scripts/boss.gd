extends CharacterBody2D
class_name Boss


@export var pew: Resource
@export var timer: Timer
@export var healthUp: Timer
@onready var pewpewpew: AudioStreamPlayer2D = $pewpewpew

var health = 1000
var attacking = false
var player

func _ready() -> void:
	player = get_node("/root/main/Shooter")

func take_fire_damage():
	health -= Global.fireDmg

func take_boom_damage():
	health -= Global.explosionDmg
	
func take_zone_damage():
	health -= Global.zoneDmg


func _physics_process(_delta):
	if (attacking == false):
		%BossAnimation.play("boss_idle")
	if health <= 0:
		Global.score += 250
		queue_free()
	if Global.health <= 0:
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
#
func _on_pewpew_timeout() -> void:
	pewpewpew.play()
	var new_pew = pew.instantiate()
	get_parent().add_child(new_pew)
	var pew_go = position.direction_to(player.global_position)
	new_pew.look_at(player.global_position)
	new_pew.fire(pew_go, 500)
	new_pew.position = position
	timer.start()
	
func _on_health_timeout() -> void:
	health += 100
	healthUp.start()
	
