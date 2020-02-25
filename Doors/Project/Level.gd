extends "res://Scripts/Levels/Intro.gd"

onready var joystick_move := get_tree().get_root().get_node("Main/Canvas/UI/Joystick")
onready var player := get_tree().get_root().get_node("Main/Player")
var t = 0
var velocity = Vector2.ZERO
func _physics_process(delta):
	move(delta)
	
func move(delta):
	#print(player.position)
	var input = Vector2.ZERO
	if (joystick_move and joystick_move.is_working):
		#print("!!!!!!!!!!!!!!!!!!!!s")
		#print( Vector2(joystick_move.output)* 100)
		t +=delta * 2 
		input += player.position + joystick_move.output
		print(input.normalized() * 100)
		velocity =  velocity.linear_interpolate(input.normalized(),delta * 100)
		velocity = player.move_and_slide(velocity)
		#player.move_and_slide(velocity)
