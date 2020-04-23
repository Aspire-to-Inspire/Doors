extends Control

class_name Menu
onready var menu_music = $music
# Called when the node enters the scene tree for the first time.
func _ready():
	#SilentWolf.Scores.persist_score("Aram", 12)
	#SilentWolf.Scores.persist_score("Ivan", 5)
	#SilentWolf.Scores.persist_score("Edgar", 15)
	#SilentWolf.Scores.persist_score("Sacha", 9)
	#SilentWolf.Scores.persist_score("Katya", 20)
	pass
	   
	  
	#pass
	#get_tree().get_root().get_node("")
#	menu_music.play()



func _on_Button_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/Main.tscn")
	print("button pressed")



func _on_leaderboard_pressed():
	get_tree().change_scene("res://LeaderBoard.tscn")





func _on_LineEdit2_text_changed(new_text):
	SilentWolf.player_name = new_text
