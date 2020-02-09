extends "res://Scripts/Levels/Base.gd"

onready var door = $Door

func _ready():
	$Track/FinishPlate.connect("correct",self,"show_door")
	
func show_door():
	door.show()
