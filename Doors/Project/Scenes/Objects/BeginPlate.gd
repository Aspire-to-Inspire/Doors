extends Area2D

var is_active = false

func get_active_status():
	return is_active
	
func set_active_status():
	is_active = false
	
func make_somth():
	is_active = true

func _on_BeginPlate_body_entered(body):
	if(body.name == "Player" and is_active == false):
		print(is_active)
		make_somth()
