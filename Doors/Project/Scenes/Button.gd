extends Button
var effect
var recording 
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func visibility(node):
	if node:
		node.visible = !node.visible
		
	

func _on_Button_pressed():
	print("settings")
	get_tree().paused = !get_tree().paused
	visibility(get_parent().get_node("settings"))
	
	
	
		
	#effect.set_recording_active(false)
	
