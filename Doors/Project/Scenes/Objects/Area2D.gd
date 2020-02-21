extends Area2D


var is_active = false

func get_active_status():
	return is_active
	
func set_active_status():
	is_active = false
	visible = true
	
func make_somth():
	is_active = true
	visible = false
	get_owner().get_node("TrackPlate").visible = true

func _on_Area2D_body_entered(body):
	if(body.name == "Player" and is_active == false):
		make_somth()
