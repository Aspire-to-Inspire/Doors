extends Node

var input_direction
var input_activation

func _ready():
	# Do not disable this when game is paused
	set_pause_mode(PAUSE_MODE_PROCESS)
	



func _process(delta):
	input_direction = get_input_direction()
	input_activation = get_input_activation()

export var speed : float = 300
onready var joystick_move = GUI.get_child(0)
var dir = Vector2(0,0)
#onready var joystick_move := load(
func get_input_direction():
	
	#print(GUI.get_child().is_working)
	if GUI.get_child(0) and GUI.get_child(0).is_working:
		dir = GUI.get_child(0).output
	
#	var horizontal = dir.x
#	var vertical = dir.y
#	return Vector2(horizontal, vertical if horizontal == 0 else 0)
	return dir

var h = false
func get_input_activation():
#	return Input.is_action_just_pressed("ui_accept")
	h = joystick_move and joystick_move.is_working
	if h:
		return false
	else:
		dir = Vector2.ZERO	
	return  joystick_move and joystick_move.is_working
		
		


# Extremely useful for things like stopping "interact" from looping
# E.G. actor displays dialog, "interact" is the same button that closes dialog
# It would also, on the same frame, trigger interact again
func neutralize_inputs():
	input_direction = null
	input_activation = null


# Give other systems the ability to disable ALL input until a given trigger
# Useful for things like letting menu animations or scene transitions finish
func disable_input_until(wait_for_this_object, to_finish_this):
	neutralize_inputs()
	set_process(false)
	yield(wait_for_this_object, to_finish_this)
	set_process(true)


# Just for "game over"
func disable_input():
	neutralize_inputs()
	set_process(false)