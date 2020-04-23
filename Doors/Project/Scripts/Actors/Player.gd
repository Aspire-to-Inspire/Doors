extends "res://Scripts/Actors/Actor.gd"

class_name Player

signal Killed

export var speed : float = 150
var dead : bool = false

onready var joystick_move := get_tree().get_root().get_node("Main/Canvas/UI/Joystick")

func _init():
	pass
	#$AnimatedSprite.start("stand")

func _physics_process(delta: float) -> void:
	_move(delta)

func _move(delta: float) -> void:
	if joystick_move and joystick_move.is_working:
		var slide = move_and_slide(joystick_move.output * speed)
		$Ray.set_enabled(true)
		$Ray.rotation = joystick_move.output.angle() - PI/2
		if $Ray.is_colliding():
			var collision = $Ray.get_collider()
			if collision and collision.has_method("collided"):
				collision.collided(self)
		var walk = direction2str(slide.normalized())
		$AnimatedSprite.play(walk)
		
		#$AnimationPlayer.play(walk)
#		if slide and get_slide_count() != 0:
#			for i in get_slide_count():
#				var collision = get_slide_collision(i)
#				if collision and collision.get_collider().has_method("collided"):
#					collision.get_collider().collided(self)
	else:
		$Ray.set_enabled(false)
		#$AnimatedSprite.stop()
		if not $AnimatedSprite.animation == "stand":
			$AnimatedSprite.play("stand")
		#$AnimationPlayer.stop()

func hurt():
	if not dead:
		#$AnimationPlayer.play("dead")		
		$AnimatedSprite.play("dead")
		set_physics_process(false)
		dead = true

func dying_finished():
	emit_signal("Killed")
	SilentWolf.Scores.persist_score(get_parent().player_name, get_parent().level_index)
	
var directionsz = ["up", "right", "down", "left"]
func direction2str(direction):
	var angle = direction.angle()
	angle += (3 * PI) / 8
	if angle < 0:
		angle += 2 * PI
	var index = round((angle / PI) * 2)
	if index >= 4:
		index = 0
	return directionsz[index]


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "dead":
		dying_finished()


