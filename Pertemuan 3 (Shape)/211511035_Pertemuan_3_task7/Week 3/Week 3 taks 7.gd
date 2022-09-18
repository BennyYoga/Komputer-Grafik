extends "res://Week 3/Primitif Dot.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func square(titik_awal : Vector2, panjang_sisi, warna_kanan,warna_kiri):
	var res = PoolVector2Array()
	res.append_array([lineDDA(titik_awal.x,titik_awal.y,titik_awal.x + panjang_sisi,titik_awal.y,Color.aqua)])
	res.append_array([lineDDA(titik_awal.x + panjang_sisi,titik_awal.y,titik_awal.x + panjang_sisi,titik_awal.y + panjang_sisi,warna_kanan)])
	res.append_array([lineDDA(titik_awal.x + panjang_sisi,titik_awal.y + panjang_sisi,titik_awal.x,titik_awal.y + panjang_sisi,Color.aqua)])
	res.append_array([lineDDA(titik_awal.x,titik_awal.y + panjang_sisi,titik_awal.x,titik_awal.y,warna_kiri)])
	return res

func rectangle(titik_awal : Vector2, panjang_sisi, lebar_sisi):
	var res = PoolVector2Array()
	res.append_array([lineDDA(titik_awal.x,titik_awal.y,titik_awal.x + panjang_sisi,titik_awal.y,Color.aqua)])
	res.append_array([lineDDA(titik_awal.x + panjang_sisi,titik_awal.y,titik_awal.x + panjang_sisi,titik_awal.y
	 + lebar_sisi,Color.aqua)])
	res.append_array([lineDDA(titik_awal.x + panjang_sisi,titik_awal.y + lebar_sisi,titik_awal.x,titik_awal.y 
	+ lebar_sisi,Color.aqua)])
	res.append_array([lineDDA(titik_awal.x,titik_awal.y + lebar_sisi,titik_awal.x,titik_awal.y,Color.aqua)])	
	return res

func tringale(titik_awal:Vector2, alas, tinggi, warna_tinggi):
	var res = PoolVector2Array()
	res.append_array([lineDDA(titik_awal.x,titik_awal.y,titik_awal.x,titik_awal.y + tinggi,warna_tinggi)])
	res.append_array([lineDDA(titik_awal.x,titik_awal.y + tinggi ,titik_awal.x + alas ,titik_awal.y 
	+ tinggi,Color.aqua)])
	res.append_array([lineDDA(titik_awal.x + alas,titik_awal.y + tinggi,titik_awal.x,titik_awal.y,Color.aqua)])

func trapesium(titik_awal:Vector2,panjang, alas):
#	square(titik_awal,panjang)
	var res = PoolVector2Array()
	square(titik_awal,panjang,Color.transparent,Color.aqua)
	titik_awal.x = titik_awal.x+panjang
	tringale(titik_awal,alas,panjang,Color.transparent)

func trapesium_samakaki(titik_awal : Vector2,panjang,alas):
	var res = PoolVector2Array()
	square(titik_awal,panjang,Color.transparent,Color.transparent)
	res.append_array([lineDDA(titik_awal.x,titik_awal.y + panjang,titik_awal.x - alas,titik_awal.y + panjang,Color.aqua)])
	res.append_array([lineDDA(titik_awal.x - alas,titik_awal.y + panjang,titik_awal.x,titik_awal.y,Color.aqua)])
	titik_awal.x = titik_awal.x+panjang
	tringale(titik_awal,alas,panjang,Color.transparent)

func jajargenjang(titik_awal: Vector2, panjang,alas):
	var res = PoolVector2Array()
	square(titik_awal,panjang,Color.transparent,Color.transparent)
	res.append_array([lineDDA(titik_awal.x,titik_awal.y,titik_awal.x - alas,titik_awal.y,Color.aqua)])
	res.append_array([lineDDA(titik_awal.x - alas,titik_awal.y,titik_awal.x,titik_awal.y + panjang,Color.aqua)])	
	titik_awal.x = titik_awal.x+panjang
	tringale(titik_awal,alas,panjang,Color.transparent)
	


func _on_Control_draw():
	var square_point = Vector2(50,50);
	var rectangle_point = Vector2(50,270)
	var tringale_point = Vector2(300,50)
	var trapesium_point = Vector2(300,300)
	var trapesium_samakaki_point = Vector2(600,300)
	var jajargenjang_point = Vector2(600,50)
	
	square(square_point,200,Color.aqua,Color.aqua)
	rectangle(rectangle_point, 200, 100)
	tringale(tringale_point,200,150,Color.aqua)
	trapesium(trapesium_point,100,80)
	trapesium_samakaki(trapesium_samakaki_point,100,80)
	jajargenjang(jajargenjang_point,100,80)
	
	pass # Replace with function body.


func _on_Back_pressed():
	get_tree().change_scene("res://Week 3/Week 3 taks 6.tscn")
	pass # Replace with function body.


func _on_Next_pressed():
	get_tree().change_scene("res://MainPage/Control.tscn")
	pass # Replace with function body.
