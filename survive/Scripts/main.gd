extends Node2D

@onready var main = get_node("/root/main")

@onready var game_timer: Timer = %GameTimer
@export var orc: Resource
@export var karen: Resource
@export var boss: Resource
@export var waves: Timer
@export var bossSpawn: Timer

var spawn_points := []
		

func spawn_orc():
	var newOrc = preload("res://Scenes/orc.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	newOrc.global_position = %PathFollow2D.global_position
	add_child(newOrc)

func spawn_karen():
	var newKaren = preload("res://Scenes/karen.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	newKaren.global_position = %PathFollow2D.global_position
	add_child(newKaren)

func spawn_boss():
	var newBoss = preload("res://Scenes/boss.tscn").instantiate()
	newBoss.global_position = $Marker2D.global_position
	add_child(newBoss)
	
func _ready() -> void:
	game_timer.start()
	print(game_timer.time_left)
	for i in Global.mobs:
		spawn_orc()
		spawn_karen()

func _on_thirty_seconds_timeout() -> void:
	for i in Global.mobs:
		spawn_orc()
		spawn_karen()
		
	Global.health += 250
	Global.charSpeed += 50
	Global.orcSpeed += 1
	Global.karenSpeed += 1

	Global.orcDamage += 5
	Global.bossDamage += 5
	Global.karenDamage += 5

	Global.explosionDmg += 10
	Global.fireDmg += 10
	Global.zoneDmg += 10
	
	Global.mobs += 5
	
	waves.start()
	
func _on_boss_spawn_timeout() -> void:
	spawn_boss()
	bossSpawn.start()
