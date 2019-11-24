extends KinematicBody2D

var directions = ["upright", "downright", "downleft", "upleft"]
func direction2str(direction):
	var angle = direction.angle()
	angle += PI/4
	if angle < 0:
		angle += 2 * PI
	var index = round((angle / PI) * 2)
	if index >= 4:
		index = 0
	return directions[index]