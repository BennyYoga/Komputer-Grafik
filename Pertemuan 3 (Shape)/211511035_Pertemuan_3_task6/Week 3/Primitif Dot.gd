extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func put_pixel(x, y, color):
	draw_primitive(PoolVector2Array([Vector2(x, y)]), PoolColorArray([color]),PoolVector2Array())
	
func lineDDA(xa, ya, xb, yb, color):
	var dx = xb - xa
	var dy = yb - ya
	var steps
	var xIncrement
	var yIncrement
	var x = xa
	var y = ya
	if (abs(dx) > abs(dy)) :
		steps = abs(dx)
	else :
		steps = abs(dy)
	
	xIncrement = dx/ float(steps)
	yIncrement = dy/ float(steps)
	put_pixel(round(x), round(y), color)
	
	for k in steps:
		x += xIncrement
		y += yIncrement
		if(k%5 == 0):
			put_pixel(round(x), round(y), color)
		elif(k%2 == 0  || k%3==0):
			put_pixel(round(x), round(y), Color.transparent)
		else :
			put_pixel(round(x), round(y), color)

func lineBres(xa, ya, xb, yb, color):
	var dx = abs(xa - xb)
	var dy = abs(ya - yb)
	var p = 2 * dy - dx
	var twoDy = 2 * dy
	var twoDyDx = 2 * (dy - dx)
	var x
	var y
	var xEnd
	
	if xa > xb :
		x = xb
		y = yb
		xEnd = xa
	else :
		x = xa
		y = ya
		xEnd = xb
		put_pixel(x, y, color)

	while x < xEnd :
		x += 1
		if p < 0 :
			p += twoDy
		else :
			y += 1
			p += twoDyDx
		put_pixel(x, y, color)
