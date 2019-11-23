extends StaticBody2D

export var health = 50
#0 = wrong door, 1 = right door, 2 = trigger door
export(int) var door_type = 0

var opened: bool = false

func collided(player):
	health -= 1
	if health <= 0 and !opened:
		opened = true
		if door_type == 1:
			var progress = get_tree().get_root().get_node("Main/UI/Timer")
			var timer = progress.get_node("Timer")
			timer.wait_time = timer.time_left + 5
			progress.max_value = timer.wait_time
			timer.start()
			$Open.set_visible(true)
			$Collision.set_disabled(true)
		elif door_type == 0:
			$Bricked.set_visible(true)