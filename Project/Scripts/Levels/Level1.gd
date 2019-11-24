extends "res://Scripts/Levels/Base.gd"

func _ready():
	randomize()
	var idx = (randi() % 3) + 1
	print(idx)
	get_node("Door" + str(idx)).door_type = 1

func _on_Door_state_changed(door, toggle):
	if door.door_type == 1:
		_on_win(door)