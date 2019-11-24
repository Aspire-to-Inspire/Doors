extends Control

func _ready():
	set_as_toplevel(true)



func _on_Pause_pressed():
	get_tree().paused = true
	get_node("Resume").visible = true


func _on_Resume_pressed():
	get_tree().paused = false
	get_node("Resume").visible = false
