extends "res://Scene/Script/primitif.gd"

# Declare member variables here. Examples:
var left = 10
var right = 1014
var bottom = 590
var top = 10

# Called when the node enters the scene tree for the first time.

func _init(ci: CanvasItem).(ci):
	pass
	
func frame() :
	lineDDA(left,top,right,top)
	lineDDA(left,top,left,bottom)
	lineDDA(right,bottom,left,top)
	lineDDA(right,top,right,bottom)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func cartesian() :
	lineDDA(centerX,top,centerX,bottom)
	lineDDA(left,centerY,right,centerY)
	pass
