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
	if(timer.get_wait_time() > 2):
		timer.set_wait_time(timer.get_wait_time() - 2)
		timer.start()

