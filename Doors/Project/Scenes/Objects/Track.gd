extends Area2D

onready var begin = get_owner().get_node("BeginPlate")

var is_active = false

func get_active_status():
	return is_active

func _on_Track_body_exited(body):
	if(body.name == "Player"):
		is_active = false
		visible = false
		begin.set_active_status()


func _on_TrackPlate_body_entered(body):
	is_active = true
