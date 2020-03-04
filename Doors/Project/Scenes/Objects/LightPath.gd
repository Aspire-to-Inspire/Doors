extends Path2D

onready var follow = get_node("Follow")

func _process(delta):
	follow.set_offset(follow.get_offset() + 75 * delta)
	
