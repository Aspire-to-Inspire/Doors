extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var s_on = get_node("music/m_on")
	var s_off = get_node("music/m_off")
	s_on.visible = !s_on.visible 
	s_off.visible = !s_off.visible
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_sound_pressed():
	var s_on = get_node("sound/s_on")
	var s_off = get_node("sound/s_off")
	s_on.visible = !s_on.visible 
	s_off.visible = !s_off.visible
	


func _on_music_pressed():
	var s_on = get_node("music/m_on")
	var s_off = get_node("music/m_off")
	s_on.visible = !s_on.visible 
	s_off.visible = !s_off.visible
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), s_on.visible)
