extends Area2D
onready var Owner = get_owner()
onready var begin = get_owner().get_node("BeginPlate")
onready var track = get_owner().get_node("TrackPlate")
signal correct

var is_active = false 

func make_somth():
	is_active = true
	var true_color = Owner.get_owner().get_true_color()
	
	print(Owner.get_color() == true_color)
	if(Owner.get_color() == true_color):
		emit_signal("correct")


func _on_FinishPlate_body_entered(body):
	if(body.name == "Player" and begin.get_active_status() and
		 track.get_active_status() and is_active == false):
			#print("finish!")
			make_somth()
