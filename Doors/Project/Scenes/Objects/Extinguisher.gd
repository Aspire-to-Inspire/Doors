extends "res://Scripts/Objects/Door.gd"


func collided(player):	
	if health <= 0:
		player.get_node("Freezer").show()
		queue_free()
		
	elif health > 0:
		$Animation.play("punch")
		health -= 1
