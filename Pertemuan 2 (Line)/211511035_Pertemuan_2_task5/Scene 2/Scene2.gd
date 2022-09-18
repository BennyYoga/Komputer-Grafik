extends "res://Scene 1/Geometrik.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func linear1():
	var x = -200
	var warna = Color(0,0,0,0);
	var warna2 = Color.yellow
	
	while(x <500):
		for i in 10:
			var y = 2*x + 3
			x+=0.5;
			put_pixel(x+center_width, center_height-y, warna2)
		for i in 10:
			var y = 2*x + 3
			x+=0.5
			put_pixel(x+center_width, center_height-y, warna)

func linear2():
	var x = -200
	var warna = Color(0,0,0,0);
	var warna2 = Color.skyblue
	
	while(x <500):
		for i in 5:
			var y = -3*x + 2
			x+=0.1;
			put_pixel(x+center_width, center_height-y, warna2)
		for i in 5:
			var y = + -3*x + 2
			x+=1;
			put_pixel(x+center_width, center_height-y, warna)
		

func linear3():
	var x = -200
	var warna = Color(0,0,0,0);
	var warna2 = Color.coral
	
	while(x <1000):
		for i in 1:
			var y = 10*x + 4
			x+=0.5;
			put_pixel(x+center_width, center_height-y, warna2)
		for i in 1:
			var y = + 10*x + 4
			x+=1;
			put_pixel(x+center_width, center_height-y, warna)
		for i in 10:
			var y = 10*x + 4
			x+=0.1;
			put_pixel(x+center_width, center_height-y, warna2)
		for i in 1:
			var y = + 10*x + 4
			x+=1;
			put_pixel(x+center_width, center_height-y, warna)
		

func _on_Control_draw():
	linear1()
	linear2()
	linear3()
	kartesian()
	border()
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().change_scene("res://Scene 1/Task 1.tscn")
	
func _on_Button2_pressed():
	get_tree().change_scene("res://MainPage/Control.tscn")
