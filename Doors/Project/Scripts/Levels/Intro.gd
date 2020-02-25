extends "res://Scripts/Levels/Base.gd"

export var texture = preload("res://Resources/Sprites/menu.png")

func _ready():
	get_tree().get_root().get_node("Main/bg").texture = texture

func _on_Door_state_changed(door, toggle):
	if door.door_type == 1:
		get_tree().get_root().get_node("Main/Player").set_default()
		_on_win(door)
