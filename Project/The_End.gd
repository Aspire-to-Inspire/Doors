extends Control

func _ready():
	get_tree().get_root().get_node("Main/Player").connect("Killed",self,"print_when_ur_ded")

func print_when_ur_ded():
	#print("UR_DED")
	get_tree().paused = true
	self.visible = true
	
func _on_Button_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/Menu.tscn")