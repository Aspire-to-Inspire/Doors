extends Node

var input_direction
var input_activation

func _ready():
	# Do not disable this when game is paused
	set_pause_mode(PAUSE_MODE_PROCESS)


func _process(delta):
	input_direction = get_input_direction()
	input_activation = get_input_activation()
	#==========================================================
export var speed : float = 300

onready var joystick_move := $UI/Joystick


#=================================================================
func get_input_direction():
	var horizontal = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	var vertical = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	
	var dir = Vector2(0,0)
	if joystick_move and joystick_move.is_working:
		dir = joystick_move.output
		
	return dir
	#Vector2(horizontal, vertical if horizontal == 0 else 0)


func get_input_activation():
	return Input.is_action_just_pressed("ui_accept")


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