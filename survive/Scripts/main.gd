extends Node2D

@onready var game_timer: Timer = %GameTimer
@export var orc: Resource
@export var karen: Resource
@export var boss: Resource
@export var waves: Timer

func _ready() -> void:
	game_timer.start()
	print(game_timer.time_left)

func spawner():
	var spawn1 = %SpawnPoint1
	var spawn2 = %SpawnPoint2
	var spawn3 = %SpawnPoint3
	var mob_spawn = 10
	if (game_timer.time_left > 30):
		var orcSpawn = orc.instantiate()
		orcSpawn.position = spawn1.position
		add_child(orcSpawn)
		print("added")

#
#func _on_ten_seconds_timeout() -> void:
	#

func _on_thirty_seconds_timeout() -> void:
	Global.health += 50
	Global.charSpeed += 50
	Global.orcSpeed += 1
	Global.Speed += 1

	Global.orcHealth += 100
	Global.bossHealth += 100
	Global.karenHealth = 100

	Global.orcDamage += 5
	Global.bossDamage += 5
	Global.karenDamage += 5

	Global.explosionDmg += 10
	Global.fireDmg += 10
	Global.zoneDmg += 10
	waves.start()
	


func _on_shield_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
