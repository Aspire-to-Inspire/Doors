extends "res://Scripts/Objects/Door.gd"


func collided(player):	
	if health <= 0:
		if get_owner().has_node("Key"):
			bleeding()
		player.get_node("Freezer").show()
		queue_free()
	elif health > 0:
		$Animation.play("punch")
		health -= 1

func bleeding():
	var progress = get_tree().get_root().get_node("Main/Canvas/UI/Timer")
	var timer = progress.get_node("Timer")
	timer.wait_time = timer.time_left - 2
	if timer.wait_time > progress.max_value:
		timer.wait_time = progress.max_value
	timer.start()
