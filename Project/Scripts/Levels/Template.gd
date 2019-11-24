extends Node2D

signal level_win

func _on_Trigger_triggered(body):
	emit_signal("level_win")
