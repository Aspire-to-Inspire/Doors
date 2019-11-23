extends Node2D

var level = preload("res://Scenes/Levels/Template.tscn")

func _ready():
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
	get_node("/root/Main").remove_child($Level)
	var instance = level.instance()
	instance.connect("level_win", self, "_on_Level_level_win")
	add_child(instance)
	instance.set_name("Level")
	move_child(instance, 0)
	set_player_to_spawn()