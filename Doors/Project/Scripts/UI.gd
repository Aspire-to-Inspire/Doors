extends Control

func _ready():
	set_as_toplevel(true)



func _on_Pause_pressed():
	get_tree().paused = true
	get_node("Resume").visible = true
	get_node("Button").visible = true
	get_node("Retry").visible = true


func _on_Resume_pressed():
	get_tree().paused = false
	get_node("Resume").visible = false
	get_node("Button").visible = false
	get_node("Retry").visible = false


func _on_Retry_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/Menu.tscn")
