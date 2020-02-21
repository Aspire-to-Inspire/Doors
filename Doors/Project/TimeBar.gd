extends MarginContainer

var ms = 0
var s = 0
export var add_value = 30
onready var bar = $ProgressBar
onready var maxvalue:int = bar.max_value
func _ready():
	bar.rect_size = Vector2(50,10)
func _process(delta):
	if ms>9:
		s+=1
		ms = 0
		print(s)
		

func _on_Timer_timeout():
	bar.value = maxvalue
	ms+=1
	maxvalue-=1


func push_value():
	maxvalue+=add_value
