extends KinematicBody2D

export var speed : float = 50

func _physics_process(delta: float) -> void:
	_move(delta)

func _move(delta: float) -> void:
	var player = get_tree().get_root().get_node("Main/Player")

	var vec_to_player = player.position - position

	var direction = vec_to_player.normalized()
	var slide = move_and_slide(direction*speed)
	if slide and get_slide_count() != 0:
		for i in get_slide_count():
			var collision = get_slide_collision(i)
			if collision and collision.get_collider().has_method("hurt"):
				collision.get_collider().hurt()