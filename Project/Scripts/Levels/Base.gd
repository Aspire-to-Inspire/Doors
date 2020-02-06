extends Node2D

signal level_win

func _on_win(body):
	emit_signal("level_win")
