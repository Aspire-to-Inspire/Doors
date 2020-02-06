extends "res://Scripts/Levels/Base.gd"

export var texture = preload("res://Resources/Sprites/bg_cave.png")

func _ready():
	get_tree().get_root().get_node("Main/bg").texture = texture 

func _on_Door_state_changed(door, toggle):
	if not toggle:
		return
	$Door.set_visible(false)
	randomize()
	get_node("WinDoor" + str((randi() % 3) + 1)).set_visible(true)

func _on_WinDoor_state_changed(door, toggle):
	emit_signal("level_win")
