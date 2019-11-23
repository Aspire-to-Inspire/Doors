extends StaticBody2D

var health = 100

func collided(player):
	health -= 1
	print(health)
	if health <= 0:
		queue_free()