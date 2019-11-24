extends Node2D

signal level_win

func _on_Trigger_triggered(body):
	emit_signal("level_win")

func _on_Door_state_changed(toggle):
	if not toggle:
		return
	$Door.set_visible(false)
	randomize()
	get_node("WinDoor" + str((randi() % 3) + 1)).set_visible(true)

func _on_WinDoor_state_changed(toggle):
	emit_signal("level_win")
