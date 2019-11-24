extends Control

func _ready():
	pass



func _on_Pause_pressed():
	get_tree().paused = true
	get_node("Resume").visible = true


func _on_Resume_pressed():
	get_tree().paused = false
	get_node("Resume").visible = false
