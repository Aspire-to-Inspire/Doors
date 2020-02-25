extends "res://Scripts/Objects/PotionsTemplate.gd"

func make_somth():
	var Player = get_tree().get_root().get_node("Main/Player")
	Player.get_node("Freezer").show()
