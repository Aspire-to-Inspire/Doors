extends Sprite

export var color = "green"

func _ready():
	$FinishPlate.connect("correct",get_owner(),"show_door")
	
func get_color():
	return color
