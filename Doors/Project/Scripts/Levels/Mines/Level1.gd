extends "res://Scripts/Levels/Base.gd"

export var texture = preload("res://Resources/Sprites/bg_cave.png")

func _ready():
	get_tree().get_root().get_node("Main/bg").texture = texture 
	randomize()
	var idx = (randi() % 3) + 1
	print(idx)
	get_node("Door" + str(idx)).door_type = 1

func _on_Door_state_changed(door, toggle):
	if door.door_type == 1:
		_on_win(door)
