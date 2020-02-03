extends StaticBody2D

export var health = 50
#0 = wrong door, 1 = right door, 2 = trigger door
export(int) var door_type = 0

signal state_changed(door, toggle)

var opened: bool = false

func collided(player):
	if opened or not visible:
		return
	if health <= 0:
		open()
		if door_type == 1:
			var progress = get_tree().get_root().get_node("Main/UI/Timer")
			var timer = progress.get_node("Timer")
			timer.wait_time = timer.time_left + 3
			if timer.wait_time > progress.max_value:
				timer.wait_time = progress.max_value
			timer.start()
		emit_signal("state_changed", self, opened)
	elif health > 0:
		$Animation.play("punch")
		health -= 1

func open():
	health = 0
	opened = true
	if door_type == 1:
		$Open.set_visible(true)
		$Collision.set_disabled(true)
	elif door_type == 0:
		$Bricked.set_visible(true)

func close():
	health = 50
	opened = false
	$Open.set_visible(true)
	$Collision.set_disabled(false)
	$Bricked.set_visible(false)