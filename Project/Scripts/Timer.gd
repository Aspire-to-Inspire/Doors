extends TextureProgress

func _ready():
	value = $Timer.wait_time
	max_value = value

func _process(delta):
	value = $Timer.time_left

func _on_Timer_timeout():
	print("you are dead, dead, dead")
