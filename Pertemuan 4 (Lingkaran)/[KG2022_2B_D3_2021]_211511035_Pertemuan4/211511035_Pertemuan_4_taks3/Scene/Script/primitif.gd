extends Node2D

var windows_height = ProjectSettings.get("display/window/size/height")
var windows_width = ProjectSettings.get("display/window/size/width")
var canvasItem: CanvasItem = null

var centerX = windows_width/2
var centerY = windows_height/2


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _init(ci: CanvasItem):
	canvasItem = ci


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#put_pixel
func put_pixel(x, y, color):
	canvasItem.draw_primitive(PoolVector2Array([Vector2(x, y)]),
		PoolColorArray([color]),
		PoolVector2Array())

func put_pixel_all(dot: PoolVector2Array, color,renggang=0,type="normal"):
	var z = 0
	for i in dot.size():
		if(type=="normal"):
			put_pixel(dot[i].x, dot[i].y, color)
		elif(type=="dash-dash"):
			if(z <= renggang or renggang == 0) :
				put_pixel(dot[i].x, dot[i].y, color)
				z+=1
			elif (z > renggang && z < 2*renggang) :
				z+=1
			else :
				z = 0
		elif (type == "point-point") :
			if (z == 0):
				put_pixel(dot[i].x, dot[i].y, color)
				z+=1
			elif (z > 0 && z <= renggang):
				z+=1
			else :
				z = 0
		elif (type == "point-dash-point"):
			if(z == 0):
				put_pixel(dot[i].x, dot[i].y, color)
				z += 1
			elif(z <= renggang):
				z+=1
			elif(z <= 2*renggang):
				put_pixel(dot[i].x, dot[i].y, color)
				z+=1
			elif(z <= 3*renggang):
				z+=1
			else :
				z=0
#line_dda
func lineDDA(xa, ya, xb, yb):
	var dx = xb - xa
	var dy = yb - ya
	var steps
	var xIncrement
	var yIncrement
	var x = xa
	var y = ya
	var res = PoolVector2Array()
	
	if (abs(dx) > abs(dy)) :
		steps = abs(dx)
	else : 
		steps = abs(dy)
		
	xIncrement = dx/ (steps)
	yIncrement = dy/ (steps)
	res.append(Vector2(round(x), round(y)))
	
	for k in steps:
		x += xIncrement
		y += yIncrement
		res.append(Vector2(round(x), round(y)))
	return res

#Line_Bresenham
func lineBres(xa, ya, xb, yb):
	var dx = abs(xa - xb)
	var dy = abs(ya - yb)
	var p = (2 * dy) - dx
	var twoDy = 2 * dy
	var twoDyDx = 2 * (dy - dx)
	var x
	var y
	var xEnd
	var yEnd
	var res = PoolVector2Array()
	
	if (xa > xb):
		x = xb
		y = yb
		xEnd = xa
	else:
		x = xa
		y = ya
		xEnd = xb
	if (ya > yb):
		yEnd = yb
	else :
		yEnd = ya
	res.append(Vector2(round(x), round(y)))
	while (x <= xEnd and y != yEnd):
		if(x != xEnd):
			x += 1
		
			if (p < 0):
				p = p + twoDy
			else:
				if (ya > yb):
					y = y - 1
				else:
					y = y + 1
				
				p = p + twoDyDx
			
			res.append(Vector2(round(x), round(y)))
	return res
