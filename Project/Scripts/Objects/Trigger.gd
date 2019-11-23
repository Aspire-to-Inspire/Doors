extends Area2D

signal triggered(body)

func _ready():
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body):
	if body and body.name == "Player":
		emit_signal("triggered", body)