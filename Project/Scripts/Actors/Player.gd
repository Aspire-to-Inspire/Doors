extends KinematicBody2D

class_name Player

export var speed : float = 150

onready var joystick_move := get_tree().get_root().get_node("Main/UI/Joystick")

func _physics_process(delta: float) -> void:
	_move(delta)

func _move(delta: float) -> void:
	if joystick_move and joystick_move.is_working:
		var slide = move_and_slide(joystick_move.output * speed)
		$Ray.set_enabled(true)
		$Ray.rotation = joystick_move.output.angle() - PI/2
		if $Ray.is_colliding():
			var collision = $Ray.get_collider()
			if collision and collision.has_method("collided"):
				collision.collided(self)
#		if slide and get_slide_count() != 0:
#			for i in get_slide_count():
#				var collision = get_slide_collision(i)
#				if collision and collision.get_collider().has_method("collided"):
#					collision.get_collider().collided(self)
	else:
		$Ray.set_enabled(false)

func hurt():
	set_visible(false)
	set_physics_process(false)
	print("LMAO YOU DED")