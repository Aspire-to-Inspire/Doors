extends StaticBody2D

export var health = 50

func collided(player):
	health -= 1
	if health <= 0:
		queue_free()
		var progress = get_tree().get_root().get_node("Main/UI/Timer")
		var timer = progress.get_node("Timer")
		timer.wait_time = timer.time_left + 5
		progress.max_value = timer.wait_time
		timer.start()