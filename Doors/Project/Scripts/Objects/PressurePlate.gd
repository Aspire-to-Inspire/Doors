extends Area2D

export var Count = 0
onready var StatusColor = $Sprite
onready var Owner = get_owner()
signal correct_code
var is_active = true

	
func make_somth():
	if(Count == Owner.get_code()):
		StatusColor.modulate = Color(1,0,0)
		Owner.set_course_counter()
		if (Owner.get_course_counter() == 4):
			get_tree().set_group("Plate","is_active",false)
			get_tree().call_group("Plate","emit_signal","correct_code")
	else:
		Owner.incorrect_code()

func _on_PressurePlate_body_entered(body):
	if (body.name == "Player"):
		 if (self.has_method("make_somth") and is_active):
				self.make_somth()

