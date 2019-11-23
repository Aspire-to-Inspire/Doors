extends KinematicBody2D

class_name Player

export var speed : float = 300

onready var joystick_move := GUI.get_child(0)
onready var joystick_look := $UI/JoystickLook

func _physics_process(delta: float) -> void:
	_move(delta)

func _move(delta: float) -> void:
	
	if joystick_move and joystick_move.is_working:
		move_and_collide(joystick_move.output * speed*delta)
	
	if joystick_look and joystick_look.is_working:
		rotation = joystick_look.output.angle()
