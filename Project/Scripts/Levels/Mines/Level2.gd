extends "res://Scripts/Levels/Base.gd"
export var texture = preload("res://Resources/Sprites/bg_cave.png")

func _ready():
	get_tree().get_root().get_node("Main/bg").texture = texture 

func _on_Door_state_changed(door, toggle):
	if door.door_type == 1:
		_on_win(door)

func _on_Trigger_entered(body):
	$Door.set_visible(not $Door.visible)
