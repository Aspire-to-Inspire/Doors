extends "res://Scripts/OverworldObject.gd"

signal teleport
export var target_scene = ""
export var target_spawn_point = 0

func do_what_this_object_does():
	GameData.zone_load_spawn_point = target_spawn_point
	GameData.zone_load_facing_direction = InputSystem.input_direction
	GUI.fade_transition_scene(target_scene)
	emit_signal("teleport")
	




onready var bar = TimeBarGUI.get_node("TimeBar")

func _on_TransitionZone_teleport():
	print("+30")
	if bar:
		bar.push_value()
