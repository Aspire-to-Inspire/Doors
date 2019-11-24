extends Control

func _ready():
	get_tree().get_root().get_node("Main/Player").connect("UR_DED",self,"print_when_ur_ded")

func print_when_ur_ded():
	print("UR_DED")
	self.visible = true
	
func _on_Button_pressed():
	pass