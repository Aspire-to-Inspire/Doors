extends Area2D

const actor = preload("res://Scripts/Actors/Actor.gd")
	
signal onWind
var is_active = false
var this_body
export var wind_speed = 50

func _physics_process(delta):
	if is_active:
		this_body.move_and_slide(self.transform.y*wind_speed)
	
	
func _on_WindArea_body_entered(body):
	if(body is actor):
		
		this_body = body
		is_active = true



func _on_WindArea_body_exited(body):
	if(body is actor):
		is_active = false
