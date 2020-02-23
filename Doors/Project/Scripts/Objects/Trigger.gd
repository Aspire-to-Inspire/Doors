extends Area2D

signal trigger_entered(body)
signal trigger_exited(body)

func _ready():
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")

func _on_body_entered(body):
	if body and body.name == "Player":
		emit_signal("trigger_entered", body)

func _on_body_exited(body):
	if body and body.name == "Player":
		emit_signal("trigger_exited", body)
