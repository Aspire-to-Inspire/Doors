extends "res://Scripts/Levels/Village/Pick1.gd"

onready var progress = get_tree().get_root().get_node("Main/Canvas/UI/Timer")
onready var timer = progress.get_node("Timer")

func _ready():
	timer.set_paused(true)

func _on_Door_state_changed(door, toggle):
	if door.door_type == 1:
		
		timer.set_paused(false)
		_on_win(door)
