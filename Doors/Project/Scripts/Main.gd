extends Node2D

var level_index = -1
var levels = [
	preload("res://Scenes/Levels/Firefighter.tscn"),
	preload("res://Scenes/Levels/Intro.tscn"),
	preload("res://Scenes/Levels/Mines/Level1.tscn"),
	preload("res://Scenes/Levels/Mines/Level2.tscn"),
	preload("res://Scenes/Levels/Mines/Level3.tscn"),
	preload("res://Scenes/Levels/Mines/Level4.tscn"),
	# preload("res://Scenes/Levels/City/Pick1.tscn"),
	preload("res://Scenes/Levels/City/NightLevel.tscn"),
	preload("res://Scenes/Levels/Track_Test.tscn"),
	preload("res://Scenes/Levels/Village/Pick1.tscn"),
	# preload("res://Scenes/Levels/Mines/Level4.tscn"),
	# preload("res://Scenes/Levels/WindLevel.tscn"),
	# preload("res://Scenes/Levels/Track_Test.tscn"),
	# preload("res://Scenes/Levels/City/NightLevel.tscn"),
	# preload("res://Scenes/Levels/PressurePlateTestScene.tscn"),
]

var music = {
	"monster": preload("res://Resources/music/ogg/monster.ogg"),
	"first": preload("res://Resources/music/ogg/first.ogg"),
	"second": preload("res://Resources/music/ogg/second.ogg"),
	"third": preload("res://Resources/music/ogg/third.ogg"),
	"transition": preload("res://Resources/music/ogg/transition.ogg"),
	"death": preload("res://Resources/music/ogg/death.ogg"),
}

var current_track = ""

onready var game_music = $music
onready var UI = $Canvas/UI
func _ready():
	load_next_level()
	set_player_to_spawn()
	UI.get_node("Score").text = str(level_index)
	play_music("first")

func set_player_to_spawn():
	$Player.set_transform($Level/PlayerSpawn.get_global_transform())

func _on_Level_level_win():
	#call it delayed so it doesn't fuck with you
	call_deferred("load_next_level")

func load_next_level():
	if $Level:
		$Level.queue_free()
		get_node("/root/Main").remove_child($Level)
	if get_node("Follower"):
		$Follower.queue_free()
		get_node("/root/Main").remove_child($Follower)
	level_index += 1
	UI.get_node("Score").text = str(level_index)
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
	
	if level_index < 15 and current_track != "first":
		play_music("first")
	elif level_index >= 15 and level_index < 30 and current_track != "second":
		play_music("second")
	elif level_index >= 30 and current_track != "third":
		play_music("third")

func play_music(track):
	game_music.stream = music[track]
	game_music.play()
	current_track = track

func timeout():
	print("TIME OUT")
	$Canvas/UI/Timer/Timer.stop()
	spawn_monster()

func spawn_monster():
	play_music("monster")
	var enemy = preload("res://Scenes/Actors/Follower.tscn")
	var instance = enemy.instance()
	add_child(instance)
	instance.set_transform($Level/EnemySpawn.get_global_transform())
