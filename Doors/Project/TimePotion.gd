extends "res://Scripts/Objects/PotionsTemplate.gd"

func make_somth():
	var progress = get_tree().get_root().get_node("Main/Canvas/UI/Timer")
	var timer = progress.get_node("Timer")
	timer.wait_time = timer.time_left + 3
	if timer.wait_time > progress.max_value:
		timer.wait_time = progress.max_value
	timer.start()
	
	print("Its OK! add time")
