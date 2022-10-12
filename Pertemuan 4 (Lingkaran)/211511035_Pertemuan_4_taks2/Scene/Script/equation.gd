extends "res://Scene/Script/primitif.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init(ci: CanvasItem).(ci):
	pass

func persegiPanjang(alas,tinggi,titik_awal: Vector2) :
	var res = PoolVector2Array()
	res.append_array(
		lineDDA(
			titik_awal.x,
			titik_awal.y,
			titik_awal.x+alas,
			titik_awal.y
		)
	)
	res.append_array(
		lineDDA(
			titik_awal.x,
			titik_awal.y-tinggi,
			titik_awal.x,
			titik_awal.y
		)
	)
	res.append_array(
		lineDDA(
			titik_awal.x+alas,
			titik_awal.y,
			titik_awal.x+alas,
			titik_awal.y-tinggi
		)
	)
	res.append_array(
		lineDDA(
			titik_awal.x+alas,
			titik_awal.y-tinggi,
			titik_awal.x,
			titik_awal.y-tinggi
		)
	)
	return res

func persegi(panjang_sisi, titik_awal: Vector2):
	var res = PoolVector2Array()
	res.append_array(
		lineDDA(
			titik_awal.x, 
			titik_awal.y, 
			titik_awal.x + panjang_sisi, 
			titik_awal.y
		)
	) 
	res.append_array(
		lineDDA(
			titik_awal.x, 
			titik_awal.y - panjang_sisi, 
			titik_awal.x + panjang_sisi, 
			titik_awal.y - panjang_sisi
		)
	) 
	res.append_array(
		lineDDA(
			titik_awal.x, 
			titik_awal.y, 
			titik_awal.x, 
			titik_awal.y - panjang_sisi
		)
	) 
	res.append_array(
		lineDDA(
			titik_awal.x + panjang_sisi, 
			titik_awal.y, 
			titik_awal.x + panjang_sisi,
			titik_awal.y - panjang_sisi
		)
	)
	return res
	
func segitigaSiku(alas,tinggi,titik_awal: Vector2):
	var res = PoolVector2Array()
	res.append_array(
		lineDDA(
			titik_awal.x,
			titik_awal.y,
			titik_awal.x+alas,
			titik_awal.y
		)
	)
	res.append_array(
		lineDDA(
			titik_awal.x,
			titik_awal.y,
			titik_awal.x,
			titik_awal.y-tinggi
		)
	)
	res.append_array(
		lineDDA(
			titik_awal.x,
			titik_awal.y-tinggi,
			titik_awal.x+alas,
			titik_awal.y
		)
	)
	return res

func trapesium(alasB,alasA,tinggi,titik_awal: Vector2,type="siku-siku") :
	var res = PoolVector2Array()
	if(type == "siku-siku") :
		res.append_array(
			lineDDA(
				titik_awal.x,
				titik_awal.y,
				titik_awal.x+alasB,
				titik_awal.y
			)
		)
		res.append_array(
			lineDDA(
				titik_awal.x, 
				titik_awal.y-tinggi,
				titik_awal.x+alasA,
				titik_awal.y-tinggi
			)
		)
		res.append_array(
			lineDDA(
				titik_awal.x,
				titik_awal.y,
				titik_awal.x,
				titik_awal.y-tinggi
			)
		)
		res.append_array(
			lineDDA(
				titik_awal.x+alasA,
				titik_awal.y-tinggi,
				titik_awal.x+alasB,
				titik_awal.y
			)
		)
	elif (type == "sama-kaki") :
		res.append_array(
			lineDDA(
				titik_awal.x,
				titik_awal.y,
				titik_awal.x+alasB,
				titik_awal.y
			)
		)
		res.append_array(
			lineDDA(
				titik_awal.x+round((alasB-alasA)/2),
				titik_awal.y-tinggi,
				titik_awal.x+alasA+round(abs(alasB-alasA)/2),
				titik_awal.y-tinggi
			)
		)
		res.append_array(
			lineDDA(
				titik_awal.x,
				titik_awal.y,
				titik_awal.x+round(abs(alasB-alasA)/2),
				titik_awal.y-tinggi
			)
		)
		res.append_array(
			lineDDA(
				titik_awal.x+alasB,
				titik_awal.y,
				titik_awal.x+alasA+round(abs(alasB-alasA)/2),
				titik_awal.y-tinggi
			)
		)
	return res

func jajargenjang(alas,tinggi,beda,titik_awal: Vector2) :
	var res = PoolVector2Array()
	res.append_array(
		lineDDA(
			titik_awal.x,
			titik_awal.y,
			titik_awal.x+alas,
			titik_awal.y
		)
	)
	res.append_array(
		lineDDA(
			titik_awal.x-beda,
			titik_awal.y-tinggi,
			titik_awal.x,
			titik_awal.y
		)
	)
	res.append_array(
		lineDDA(
			titik_awal.x+alas-beda,
			titik_awal.y-tinggi,
			titik_awal.x-beda,
			titik_awal.y-tinggi
		)
	)
	res.append_array(
		lineDDA(
			titik_awal.x+alas,
			titik_awal.y,
			titik_awal.x+alas-beda,
			titik_awal.y-tinggi
		)
	)
	return res

func lingkaran(radius,center: Vector2) :
	var res = PoolVector2Array()
	var lPixel = Vector2()
	var p = 1-radius
	lPixel.x = 0
	lPixel.y = radius
	
	res.append_array(plotPointLingkaran(center,lPixel))
	while (lPixel.x < lPixel.y) :
		lPixel.x += 1
		if (p < 0) :
			p += 2 * lPixel.x+1
		else :
			lPixel.y -= 1
			p += 2 * (lPixel.x - lPixel.y) + 1
		res.append_array(plotPointLingkaran(center,lPixel))
	return res
	
func plotPointLingkaran(center : Vector2,pixel : Vector2):
	var res = PoolVector2Array()
	
	res.append(Vector2(center.x + pixel.x,center.y + pixel.y))
	res.append(Vector2(center.x - pixel.x,center.y + pixel.y))
	res.append(Vector2(center.x + pixel.x,center.y - pixel.y))
	res.append(Vector2(center.x - pixel.x,center.y - pixel.y))
	res.append(Vector2(center.x + pixel.y,center.y + pixel.x))
	res.append(Vector2(center.x - pixel.y,center.y + pixel.x))
	res.append(Vector2(center.x + pixel.y,center.y - pixel.x))
	res.append(Vector2(center.x - pixel.y,center.y - pixel.x))
	
	return res
	pass

func ellipse(radius1, radius2, center : Vector2):
	var res = PoolVector2Array()
	var rX2 = pow(radius1,2)
	var rY2 = pow(radius2,2)
	var tworX2 = rX2 * 2
	var tworY2 = rY2 * 2
	var p
	var pixel = Vector2()
	pixel.x = 0
	pixel.y = radius2
	var pX = 0
	var pY = tworX2 * pixel.y
	
	res.append_array(plotPointEllipse(center,pixel))
	
	p = round(rY2 - (rX2 * radius2) + (1/4 * rX2))
	while (pX < pY) :
		pixel.x += 1
		pX += tworY2
		if(p < 0) :
			p += rY2 + pX
		else :
			pixel.y -= 1
			pY -= tworX2
			p += rY2 + pX - pY
		res.append_array(plotPointEllipse(center,pixel))
	
	#p = round(rY2* (pixel.x+0.5) + rX2*(pixel.y-1) * (pixel.y-1) - rX2*rY2)
	
	while (pixel.y > 0) :
		print(pixel)
		print(p)
		print(rY2)
		pixel.y-=1
		pY -= tworX2
		if (p > 0) :
			p += rX2 - pY
		else :
			pixel.x += 1
			p += rX2 - pY + pX
		res.append_array(plotPointEllipse(center,pixel))
	return res

func plotPointEllipse(center : Vector2, pixel : Vector2):
	var res = PoolVector2Array()
	
	res.append(Vector2(center.x + pixel.x, center.y + pixel.y))
	res.append(Vector2(center.x - pixel.x, center.y + pixel.y))
	res.append(Vector2(center.x + pixel.x, center.y - pixel.y))
	res.append(Vector2(center.x - pixel.x, center.y - pixel.y))
	
	return res

func layangLayang(diagonal1,diagonal2,perpotongan,titik_awal: Vector2):
	var res = PoolVector2Array()
	
	if(perpotongan >= diagonal2) :
		return
	
	res.append_array(
		lineDDA(
			titik_awal.x,
			titik_awal.y,
			titik_awal.x+(diagonal1/2),
			titik_awal.y+(perpotongan)
		)
	)
	res.append_array(
		lineDDA(
			titik_awal.x,
			titik_awal.y,
			titik_awal.x+(diagonal1/2),
			titik_awal.y-(diagonal2-perpotongan)
		)
	)
	res.append_array(
		lineDDA(
			titik_awal.x+(diagonal1/2),
			titik_awal.y-(diagonal2-perpotongan),
			titik_awal.x+diagonal1,
			titik_awal.y
		)
	)
	res.append_array(
		lineDDA(
			titik_awal.x+(diagonal1/2),
			titik_awal.y+(perpotongan),
			titik_awal.x+(diagonal1),
			titik_awal.y
		)
	)
	return res

func ketupat(diagonal1,diagonal2,titik_awal: Vector2):
	var res = PoolVector2Array()
	res.append_array(
			lineDDA(
				titik_awal.x,
				titik_awal.y,
				titik_awal.x+(diagonal1/2),
				titik_awal.y+(diagonal2/2)
			)
		)
	res.append_array(
			lineDDA(
				titik_awal.x,
				titik_awal.y,
				titik_awal.x+(diagonal1/2),
				titik_awal.y-(diagonal2/2)
			)
	)
	res.append_array(
			lineDDA(
				titik_awal.x+(diagonal1/2),
				titik_awal.y-(diagonal2/2),
				titik_awal.x+diagonal1,
				titik_awal.y
			)
	)
	res.append_array(
		lineDDA(
			titik_awal.x+(diagonal1/2),
			titik_awal.y+(diagonal2/2),
			titik_awal.x+diagonal1,
			titik_awal.y
		)
	)
	return res
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
