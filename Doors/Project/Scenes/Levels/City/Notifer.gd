extends "res://Scripts/Objects/PotionsTemplate.gd"

func _on_PotionsTemplate_body_entered(body):
	if (body.name == "Player" and is_visible()):
		body.hurt()
