extends "res://Scripts/Levels/Base.gd"

onready var door = $Door
var color = ["green","blue","red"]


func _ready():
	shuffle_list(color)
	print("True Color is:")
	print(color[0])
	#$Track/FinishPlate.connect("correct",self,"show_door")


func shuffle_list(var Code,var start_index = 0,var last_index = 2):
	if(last_index  == start_index):
		return
	randomize()
	var random_count = randi()%3
	var p = Code[last_index]
	Code[last_index] = Code[random_count]
	Code[random_count] = p
	last_index-=1
	shuffle_list(Code,0,last_index)
	
func get_true_color():
	return color[0]
	
func show_door():
	door.show()

