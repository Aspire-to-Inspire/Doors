extends Area2D

func make_somth():
	pass

func _on_PotionsTemplate_body_entered(body):
		if (body.name == "Player"):
		 if (self.has_method("make_somth")):
				self.make_somth()
				queue_free()
