extends "res://Scripts/Levels/Base.gd"
onready var Player = get_tree().get_root().get_node("Main/Player")
export var speed_of_wind = 70

func _physics_process(delta):
	Player.move_and_slide(Vector2(1,0)*speed_of_wind)
