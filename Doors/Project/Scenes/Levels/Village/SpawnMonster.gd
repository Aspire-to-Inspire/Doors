extends "res://Scripts/Levels/Village/Pick1.gd"

onready var progress = get_tree().get_root().get_node("Main/Canvas/UI/Timer")
onready var timer = progress.get_node("Timer")

func _ready():
	get_node("/root/Main").spawn_monster() #spawn the monster
	
func _on_Door_state_changed(door, toggle):
	if door.door_type == 1:
		timer.wait_time = progress.max_value
		timer.start()
		get_node("/root/Main").delete_monster()
		_on_win(door)
	
	
