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


func countMatrixDimension(m:Array):
	var dimen
	# Check is matrix dimension consistent or not
	for i in range(1, m.size()):
		if typeof(m[0]) != typeof(m[i]):
			dimen = [-1, -1]
		if typeof(m[0]) == TYPE_ARRAY and typeof(m[i]) == TYPE_ARRAY:
			if m[0].size() != m[i].size():
				dimen = [-1, -1]
	
	# Count dimension
	if dimen != [-1, -1]:
		if typeof(m[0]) != TYPE_ARRAY:
			dimen = [1, m.size()]
		else:
			dimen = [m.size(), m[0].size()]
	
	return dimen


func matrix3x3setIdentity():
	var M = []
	for i in range(3):
		var M2 = []
		for j in range(3):
			M2.append(float(i==j))
		M.append(M2)	
	return M

func checkSameDimension(matriks1:Array, matriks2:Array):
	var isSame
	isSame = countMatrixDimension(matriks1) == countMatrixDimension(matriks2)
	return isSame
	
func matrix3x3Add(m1:Array, m2:Array):
	var hasil = []
	if checkSameDimension(m1, m2):
		if typeof(m1[0]) == TYPE_ARRAY:
			for i in range(m1.size()):
				var arr = []
				for j in range (m1[i].size()):
					arr.append(m1[i][j] + m2[i][j])
				hasil.append(arr)
		else:
			for i in range(m1.size()):
				hasil.append(m1[i] + m2[i])
	else:
		print("Error format matriks tidak sesuai")
	return hasil

func matrix3x3Substruct(m1:Array, m2:Array):
	var hasil = []
	if checkSameDimension(m1, m2):
		if typeof(m1[0]) == TYPE_ARRAY:
			for i in range(m1.size()):
				var arr = []
				for j in range (m1[i].size()):
					arr.append(m1[i][j] - m2[i][j])
				hasil.append(arr)
		else:
			for i in range(m1.size()):
				hasil.append(m1[i] - m2[i])
	else:
		print("Error format matriks tidak sesuai")
	return hasil

func checkCanMultiply(m1:Array, m2:Array):
	var isValid = true
	var dimensi1 = countMatrixDimension(m1)
	var dimensi2 = countMatrixDimension(m2)
	
	if dimensi1 == [-1,-1] or dimensi2 == [-1,-1]:
		isValid = false
	if dimensi1[1] != dimensi2[0]:
		isValid = false
	return isValid

func matrix3x3Multiply(m1:Array, m2:Array):
	var hasil = []
	if checkCanMultiply(m1, m2):
		for i in range(3):
			var elm = []
			for j in range(m2[0].size()):
				var nilai = 0
				for x in range(m2.size()):
					nilai += m1[i][x] * m2[x][j]
				elm.append(nilai)
			hasil.append(elm)
	else:
		print("ERROR FORMAT MATRIKS SALAH")
	return hasil

func translation(titik:Vector2, translate:Vector2):
	var identity = matrix3x3setIdentity()
	identity[0][2] = translate.x
	identity[1][2] = translate.y
	var titikM = [[titik.x], [titik.y], [1]]
	var result = matrix3x3Multiply(identity, titikM)
	return result

func scale(titik:Vector2, scale:Vector2):
	var identity = matrix3x3setIdentity()
	identity[0][0] = scale.x
	identity[1][1] = scale.y
	var titikM = [[titik.x], [titik.y], [1]]
	var result = matrix3x3Multiply(identity, titikM)
	return result

func rotateTitik(titik:Vector2, degree:float, stat:String, titik_pusat:Vector2 = Vector2(0,0)):
	degree = deg2rad(degree)
	var rotateM = matrix3x3setIdentity()
	rotateM[0][0] = cos(degree)
	if(stat == "ccw"):
		rotateM[0][1] = sin(degree) * -1
		rotateM[1][0] = sin(degree)
	elif(stat=="cc"):
		rotateM[0][1] = sin(degree) 
		rotateM[1][0] = sin(degree) * -1
	rotateM[1][1] = cos(degree)
	
	#translation
	var translasi = Vector2(0 - titik_pusat.x, 0 - titik_pusat.y)
	var translation = translation(titik, translasi)
	var rotasi = matrix3x3Multiply(rotateM, translation)
	var result = translation(Vector2(rotasi[0][0], rotasi[1][0]), titik_pusat)
	return result

func rotateDots(dots: PoolVector2Array, degree:float, stat:String, titik_pusat:Vector2 = Vector2(0,0)):
	var result = PoolVector2Array()
	for dot in dots:
		var rm = rotateTitik(dot, degree, stat, titik_pusat)
		result.append(Vector2(rm[0][0], rm[1][0]))
	return result
