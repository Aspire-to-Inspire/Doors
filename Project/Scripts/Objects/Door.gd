extends StaticBody2D

export var health = 50
#0 = wrong door, 1 = right door, 2 = trigger door
export(int) var door_type = 0

signal state_changed(toggle)

var opened: bool = false

func collided(player):
	if health <= 0 and !opened:
		opened = true
		if door_type == 1:
			var progress = get_tree().get_root().get_node("Main/UI/Timer")
			var timer = progress.get_node("Timer")
			timer.wait_time = timer.time_left + 4
			if timer.wait_time > progress.max_value:
				progress.max_value = timer.wait_time
			timer.start()
			$Open.set_visible(true)
			$Collision.set_disabled(true)
		elif door_type == 0:
			$Bricked.set_visible(true)
		emit_signal("state_changed", opened)
	elif health > 0:
		$Animation.play("punch")
		health -= 1