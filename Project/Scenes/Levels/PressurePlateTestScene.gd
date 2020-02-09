extends "res://Scripts/Levels/Base.gd"
var Code = [2,3,1,4]
var CourseCounter = 0
onready var door = $Door

func _ready():
	$PressurePlate.connect("correct_code",self,"show_door")
	
	
func get_course_counter():
	return CourseCounter

func get_code():
	return Code[CourseCounter]
	
func set_course_counter():
	CourseCounter+=1

func incorrect_code():
	CourseCounter = 0

func show_door():
	door.show()
