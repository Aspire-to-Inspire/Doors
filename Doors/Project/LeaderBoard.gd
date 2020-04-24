extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(SilentWolf.Scores.get_high_scores(0), "sw_scores_received")
	#print("Scores: " + str(SilentWolf.Scores.scores)) 
	var i = 1
	for x in SilentWolf.Scores.scores:		
		$ItemList.add_item(str(i)+". " + x.player_name +"          "+ str(x.score)+ "\n")
		i+=1
		#$Results.text+= x.player_name +"          "+ str(x.score)+ "\n";
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")
