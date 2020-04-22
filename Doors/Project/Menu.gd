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
	yield(SilentWolf.Scores.get_high_scores(0), "sw_scores_received")
	print("Scores: " + str(SilentWolf.Scores.scores))   
	  
	#pass
	#get_tree().get_root().get_node("")
#	menu_music.play()



func _on_Button_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/Main.tscn")
	print("button pressed")

