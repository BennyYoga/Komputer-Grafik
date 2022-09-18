extends "res://Scene 1/Primitif.gd";

var width = ProjectSettings.get_setting("display/window/size/width");
var height = ProjectSettings.get_setting("display/window/size/height");
var center_width = (width)/2;
var center_height =  (height)/2

func put_pixel(x, y, color):
	draw_primitive(PoolVector2Array([Vector2(x, y)]), PoolColorArray([color]),PoolVector2Array())
		
func border():
	lineBres(10,10,width-10,10,Color.aqua);
	lineDDA(width-10,10,width-10,height-10,Color.aqua);
	lineBres(width-10,height-10,10,height-10,Color.aqua);
	lineDDA(10,height-10,10,10,Color.aqua);

func kartesian():
	
	lineBres(10,center_height,width-10,center_height,Color.white);
	lineDDA(center_width,height-10,center_width,10,Color.white);

func linear():
	var x = -200
	var warna = Color.yellow;
	
	while(x <center_height):
		var y = 2*x + 3
		put_pixel(x+center_width, center_height-y, warna)
		x += 1;

func kuadrat():
	var x = -200
	var warna = Color.red;
	
	while(x <center_height):
		var y = x*x + 3*x + 2
		put_pixel(x+center_width, center_height-y, warna)
		x += 0.1;

func trigonometri():
	var x = -200
	var warna = Color.coral;
	
	while(x <center_height):
		var y = sin(2*x+1)*30
		put_pixel(x+center_width, center_height-y, warna)
		x += 0.8;
		
		
func line():
	lineDDA(35,40,35,55,Color.aqua);

func line2():
	newLineBres2(50,70,60,70,Color.aqua);
