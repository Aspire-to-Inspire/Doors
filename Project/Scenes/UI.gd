extends Control

onready var resume_music = $resume
func _ready():
	pass



func _on_Pause_pressed():	
	get_tree().paused = true
	get_node("Resume").visible = true
	if resume_music:
		resume_music.play()
	


func _on_Resume_pressed():
	get_tree().paused = false
	get_node("Resume").visible = false
	if resume_music:
		resume_music.stop()
