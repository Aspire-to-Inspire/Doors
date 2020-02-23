extends "res://Scripts/Actors/Actor.gd"

export var speed : float = 50
var path = []
onready var Ray = get_node("Ray")
#onready var nav_movement = get_tree().get_root().get_node("Main/Navigation2D")
func _ready():
	$Ray.add_exception($CollisionShape2D)
	
func _physics_process(delta: float) -> void:
	_move(delta)

func _move(delta: float) -> void:
	#Ray.set_collision_mask_bit(1)
	#var nav_movement = get_tree().get_root().get_node("Intro/Navigation2D")
	var player = get_tree().get_root().get_node("Main/Player")
	var vec_to_player = player.position - position
	var direction = vec_to_player.normalized()
	Ray.rotation = direction.angle() - PI/2
	var slide = move_and_slide(direction*speed)
	#path = nav_movement.get_simple_path(get_global_position(),player.get_global_position())
	#var direction = get_global_position().distance_to(path[0])
	#move_and_slide(direction*speed)
	var walk = direction2str(direction)
	$AnimationPlayer.play(walk)
	
#	if slide and get_slide_count() != 0:
#		for i in get_slide_count():
#			var collision = get_slide_collision(i)
#			if collision and collision.get_collider().has_method("hurt"):
#				collision.get_collider().hurt()
	if ($Ray.is_colliding() and Ray.get_collider().name == "Player"):
		Ray.get_collider().hurt()
		
		
	
		
