extends Area2D

onready var begin = get_owner().get_node("BeginPlate")

func _on_Track_body_exited(body):
	if(body.name == "Player"):
		begin.set_active_status()
