extends TextureProgress

func _ready():
	value = $Timer.wait_time
	max_value = value

func _process(delta):
	value = $Timer.time_left

func _on_Timer_timeout():
	get_tree().get_root().get_node("Main").timeout()
