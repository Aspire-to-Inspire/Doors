extends Button
var effect
var recording 
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var idx = AudioServer.get_bus_index("Master")
	effect = AudioServer.get_bus_effect(idx,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	print("sound")
	var idx = AudioServer.get_bus_index("Master")
	effect = AudioServer.get_bus_effect(idx,0)
	if effect.is_recording_active():
		recording = effect.get_recording() 
		effect.set_recording_active(false) 
	else:
			effect.set_recording_active(true) 
	
		
	#effect.set_recording_active(false)
	
