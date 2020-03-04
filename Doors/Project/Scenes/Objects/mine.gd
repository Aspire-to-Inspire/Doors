extends "res://Scripts/Objects/PotionsTemplate.gd"

var t = Timer.new()
var is_active = false

func make_somth():
	is_active = true
	$Particles2D.emitting = true
	$Particles2D/CPUParticles2D.emitting = true
	$Particles2D/CPUParticles2D2.emitting = true
	$Particles2D/CPUParticles2D3.emitting = true
	sleep()
	yield(t, "timeout")
	t.queue_free()
	queue_free()
	
func _on_PotionsTemplate_body_entered(body):
	if (body.name == "Player" and is_visible()):
		if (self.has_method("make_somth") and not is_active):
			self.make_somth()

func sleep():
	t.set_wait_time(0.8)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()	
