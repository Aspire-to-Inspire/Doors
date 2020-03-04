extends "res://Scripts/Objects/PotionsTemplate.gd"

onready var progress = get_tree().get_root().get_node("Main/Canvas/UI/Timer")
onready var timer = progress.get_node("Timer")

func make_somth():
	if(timer.get_wait_time() - 2 > 0):
		timer.set_wait_time(timer.get_wait_time() - 2)
		timer.start()
	
		
func _on_PotionsTemplate_body_entered(body):
		if (body.name == "Player" and is_visible()):# and not timer.is_stopped()):
		 if (self.has_method("make_somth")):
				self.make_somth()
				
