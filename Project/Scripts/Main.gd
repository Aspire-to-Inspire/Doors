extends Node2D

var level_index = -1
var levels = [
	preload("res://Scenes/Levels/Level1.tscn"),
	preload("res://Scenes/Levels/Level2.tscn"),
	preload("res://Scenes/Levels/Level3.tscn"),
#	preload("res://Scenes/Levels/Level4.tscn"),
]

func _ready():
	load_next_level()
	set_player_to_spawn()

func set_player_to_spawn():
	$Player.set_transform($Level/PlayerSpawn.get_global_transform())

func _on_Level_level_win():
	#call it delayed so it doesn't fuck with you
	call_deferred("load_next_level")

func load_next_level():
	if $Level:
		$Level.queue_free()
		get_node("/root/Main").remove_child($Level)
	if find_node("Follower"):
		$Follower.queue_free()
		get_node("/root/Main").remove_child($Follower)
	level_index += 1
	print(level_index)
	var level
	if level_index >= levels.size():
		print("Reached final level! Randomizing...")
		randomize()
		level = levels[randi() % levels.size()]
	else:
		level = levels[level_index]
	var instance = level.instance()
	instance.connect("level_win", self, "_on_Level_level_win")
	add_child(instance)
	instance.set_name("Level")
	move_child(instance, 0)
	set_player_to_spawn()

func timeout():
	print("TIME OUT")
	$UI/Timer/Timer.stop()
	var enemy = preload("res://Scenes/Actors/Follower.tscn")
	var instance = enemy.instance()
	add_child(instance)
	instance.set_transform($Level/EnemySpawn.get_global_transform())