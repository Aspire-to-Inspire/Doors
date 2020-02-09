extends "res://Scripts/Objects/PotionsTemplate.gd"
var playerScene = preload("res://Scenes/Actors/Player.tscn")
var weaponScene  = preload("res://Scenes/Objects/Light2D.tscn")
var playerInsctance = playerScene.instance()

func make_somth():
	playerInsctance.add_child(weaponScene.instance())
	if (playerInsctance.has_node("Light2D")):
		print("Add Weapon!")
