extends "res://Scripts/Objects/Door.gd"

func collided(player):	
	if health <= 0:
		get_owner().get_node("Key").show()
		queue_free()
	elif health > 0:
		$Animation.play("punch")
		health -= 1

