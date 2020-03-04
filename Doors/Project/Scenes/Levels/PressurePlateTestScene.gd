extends "res://Scripts/Levels/Base.gd"
var Code = [1,2,3,4]
var CourseCounter = 0
onready var door = $Door

func _ready():
	shuffle_list(Code)
	#print(Code)
	$PressurePlate.connect("correct_code",self,"show_door")
	

func shuffle_list(var Code,var start_index = 0,var last_index = 3):
	if(last_index  == start_index):
		return
	randomize()
	var random_count = randi()%4
	var p = Code[last_index]
	Code[last_index] = Code[random_count]
	Code[random_count] = p
	last_index-=1
	shuffle_list(Code,0,last_index)
		
func get_course_counter():
	return CourseCounter

func get_code():
	return Code[CourseCounter]
	
func set_course_counter():
	CourseCounter+=1

func incorrect_code():
	pass
#	CourseCounter = 0
#	get_tree().set_group("Plate","modulate",Color(1,1,1))

func show_door():
	door.show()


func _on_Door_state_changed(door, toggle):
	if door.door_type == 1:
		_on_win(door)
