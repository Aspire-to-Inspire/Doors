extends Control

class_name Menu

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().get_root().get_node("")



func _on_Button_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/Main.tscn")
	print("button pressed")

