extends Control

class_name Menu
onready var menu_music = $Audio
# Called when the node enters the scene tree for the first time.
func _ready():
	#get_tree().get_root().get_node("")
	menu_music.play()



func _on_Button_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/Main.tscn")
	print("button pressed")

