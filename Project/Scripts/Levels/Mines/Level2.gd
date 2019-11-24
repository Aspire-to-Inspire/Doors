extends "res://Scripts/Levels/Base.gd"

func _on_Door_state_changed(door, toggle):
	if door.door_type == 1:
		_on_win(door)

func _on_Trigger_entered(body):
	$Door.set_visible(not $Door.visible)
