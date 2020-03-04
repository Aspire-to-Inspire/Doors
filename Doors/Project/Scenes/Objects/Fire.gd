extends StaticBody2D

onready var Player = get_tree().get_root().get_node("Main/Player")

func _on_Area2D_body_entered(body):
	if(body.name == "Player" and Player.get_node("Freezer").is_visible() ):
		queue_free()
