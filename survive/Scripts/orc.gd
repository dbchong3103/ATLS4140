extends CharacterBody2D
class_name Orc

var player
var health = 500

@onready var orc_attack: AudioStreamPlayer2D = $OrcAttack
@onready var spawner: Timer = $Spawner
@onready var orc_walk: AudioStreamPlayer2D = $OrcWalk

func _ready() -> void:
	player = get_node("/root/main/Shooter")

func take_fire_damage():
	health -= Global.fireDmg

func take_boom_damage():
	health -= Global.explosionDmg
	print("yay")
	
func take_zone_damage():
	health -= Global.zoneDmg
	print("yeet")

func _physics_process(_delta):
	
	position += (player.position - position).normalized() * Global.orcSpeed
	if health <= 0:
		Global.score += 150
		queue_free()
	if position.distance_to(player.position) > 50:
		Global.orcSpeed = 2
		%OrcAnimation.play("orc_run")
	if position.distance_to(player.position) < 50:
		Global.orcSpeed = 0
		%OrcAnimation.play("orc_attack")
		orc_attack.play()
		
func _on_axe_body_entered(body: Player) -> void:
	Global.health -= Global.orcDamage
	print(Global.health)
	if Global.health <= 0:
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")

func _on_spawner_timeout() -> void:
	health += 100
