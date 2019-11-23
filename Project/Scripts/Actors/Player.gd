extends KinematicBody2D

class_name Player

export var speed : float = 150

onready var joystick_move := get_tree().get_root().get_node("Main/UI/Joystick")

func _physics_process(delta: float) -> void:
	_move(delta)

func _move(delta: float) -> void:
	if joystick_move and joystick_move.is_working:
			var slide = move_and_slide(joystick_move.output * speed)
			if slide and get_slide_count() != 0:
				var collision = get_slide_collision(0)
				if collision and collision.get_collider().has_method("collided"):
					collision.get_collider().collided(self)