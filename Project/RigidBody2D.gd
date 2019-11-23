extends RigidBody2D
const MOVE_SPEED = 300
export var speed = 200

# at which distance to stop moving
# NOTE: setting this value too low might result in jerky movement near destination
const eps = 0.2
export var near = 10
var player = null
export var rad = 250
func _ready():
	set_physics_process(true)
	add_to_group("zombies")
	
func _physics_process(delta):
	if player == null:
		return
	var playerpos = player.get_global_position()
	var mypos = self.get_global_position()
	var is_active:bool = (playerpos.x-mypos.x)*(playerpos.x-mypos.x) +(playerpos.y-mypos.y)*(playerpos.y-mypos.y)<=rad*rad
	if !is_active :
		return
	
	var vec_to_player = player.get_global_position() - global_position
	vec_to_player = vec_to_player.normalized()
	#global_rotation = atan2(vec_to_player.y,vec_to_player.x)
	
	#move_and_collide(vec_to_player*MOVE_SPEED*delta)
	movement(playerpos)
	zombie_is_near()
	
func set_player(p1):
	player = p1
	
var points =[]

func movement(playerpos):
	points = get_node("../Navigation2D").get_simple_path(get_global_position(), playerpos, false)
	# if the path has more than one point
	if points.size() > 1:
		var distance = points[1] - get_global_position()
		var direction = distance.normalized() # direction of movement
		if distance.length() > eps or points.size() > 2:
			set_linear_velocity(direction*speed)
		else:
			set_linear_velocity(Vector2(0, 0)) # close enough - stop moving
		

func kill():
	print("UMER")
	
func zombie_is_near():
	var px = get_global_position() - player.get_global_position()
	if(px.length() < near):
		kill()