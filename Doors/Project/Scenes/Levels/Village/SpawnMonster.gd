extends "res://Scripts/Levels/Village/Pick1.gd"

func _ready():
	get_node("/root/Main").spawn_monster() #spawn the monster
