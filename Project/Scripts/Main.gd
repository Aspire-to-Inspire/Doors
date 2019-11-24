extends Node2D

var level_index = 1
onready var game_music = $ms
onready var monster = $monstr
func _ready():
	game_music.play()
	set_player_to_spawn()

func set_player_to_spawn():
	$Player.set_transform($Level/PlayerSpawn.get_global_transform())

func _on_Level_level_win():
	#call it delayed so it doesn't fuck with you
	call_deferred("load_next_level")

func load_next_level():
	if not $Level:
		return
	$Level.queue_free()
	if $Follower:
		$Follower.queue_free()
	get_node("/root/Main").remove_child($Level)
	level_index += 1
	var level_string = "res://Scenes/Levels/Level%s.tscn" % level_index
	var level = load(level_string)
	if not level:
		print("Reached final level!")
		level_index = 0
		return
	var instance = level.instance()
	instance.connect("level_win", self, "_on_Level_level_win")
	add_child(instance)
	instance.set_name("Level")
	move_child(instance, 0)
	set_player_to_spawn()

func timeout():
	print("TIME OUT")
	game_music.stop()
	monster.play()
	var enemy = preload("res://Scenes/Actors/Follower.tscn")
	var instance = enemy.instance()
	add_child(instance)
	instance.set_transform($Level/PlayerSpawn.get_global_transform())