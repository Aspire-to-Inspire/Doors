extends "res://Scripts/Levels/Base.gd"

var doors = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
var shuffled = false

func _ready():
	randomize() 
	doors.shuffle()
	for i in doors.size():
		get_node("Door" + str(i + 1)).door_type = doors[i]

func _on_Door_state_changed(door, toggle):
	if door.door_type == 1 and shuffled:
		_on_win(door)
	else:
		door.close()
		door.health = 50
		var goat = false
		for i in doors.size():
			var d = get_node("Door" + str(i + 1))
			if d == door:
				continue
			if door.door_type == 1:
				if not goat:
					goat = true
					continue
			else:
				if d.door_type == 1:
					continue
			d.open()