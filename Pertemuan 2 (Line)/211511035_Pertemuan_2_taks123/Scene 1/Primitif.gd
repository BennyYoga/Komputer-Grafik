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


func newLineBres2(xa, ya, xb, yb, color):
	var dx = xb-xa
	var dy = yb-ya
	var xsign = 1 if dx > 0 else -1
	var ysign = 1 if dy > 0 else -1
	dx = abs(dx)
	dy = abs(dy)
	var xx
	var xy
	var yx
	var yy
	
	if dx > dy:
		xx = xsign
		xy = 0
		yx = 0
		yy = ysign
	else:
		var temp
		#swap dx and dy
		temp = dx
		dx = dy
		dy = temp
		
		xx = 0
		xy = ysign
		yx = xsign
		yy = 0
	
	var p = 2 * dy - dx
	var y=0
	print(xx, xy, yx, yy)
	for x in range(dx+1):
		var x_coor = xa + x*xx + y*yx
		var y_coor = ya + x*xy + y*yy
		put_pixel(x_coor, y_coor, color)
		print("(",x_coor,",",y_coor, ")",p)
		if p >= 0:
			y += 1
			p -= 2*dx
		p += 2*dy
