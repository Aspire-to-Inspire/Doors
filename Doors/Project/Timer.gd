extends Timer

var ms = 0 
var s = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	convert_to_p()
	
func _process(delta):
	print(s)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func convert_to_p():
	if ms>9:
		s+=1
		ms=0



func _on_Timer_timeout():
	ms+=1
