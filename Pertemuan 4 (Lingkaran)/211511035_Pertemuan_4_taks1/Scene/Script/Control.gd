extends Control

const init = preload("res://Scene/Script/init.gd")
const line = preload("res://Scene/Script/primitif.gd")
const eq = preload("res://Scene/Script/equation.gd")
var obj
var garis
var geometri
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	obj = init.new(self)
	garis = line.new(self)
	geometri = eq.new(self)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Control_draw():

	garis.put_pixel_all(
		geometri.persegi(
			50,
			Vector2(20,70)
		),
		Color.skyblue
	)
	garis.put_pixel_all(
		geometri.persegi(
			50,
			Vector2(90,70)
		),
		Color.yellow,
		10,
		"dash-dash"
	)
	
	garis.put_pixel_all(
		geometri.persegiPanjang(
			100,
			50,
			Vector2(160,70)
		),
		Color.skyblue
	)
	garis.put_pixel_all(
		geometri.persegiPanjang(
			100,
			50,
			Vector2(280,70)
		),
		Color.yellow,
		10,
		"dash-dash"
	)
	garis.put_pixel_all(
		geometri.segitigaSiku(
			100,
			50,
			Vector2(400,70)
		),
		Color.skyblue
	)
	garis.put_pixel_all(
		geometri.segitigaSiku(
			100,
			50,
			Vector2(520,70)
		),
		Color.yellow,
		10,
		"dash-dash"
	)
	
	garis.put_pixel_all(
		geometri.jajargenjang(
			50,
			50,
			20,
			Vector2(640,70)
		),
		Color.skyblue
	)
	garis.put_pixel_all(
		geometri.jajargenjang(
			50,
			50,
			20,
			Vector2(710,70)
		),
		Color.yellow,
		10,
		"dash-dash"
	)
	
	garis.put_pixel_all(
		geometri.ketupat(
			50,
			75,
			Vector2(770,50)
		),
		Color.skyblue
	)
	garis.put_pixel_all(
		geometri.ketupat(
			50,
			75,
			Vector2(840,50)
		),
		Color.yellow,
		10,
		"dash-dash"
	)
	
	garis.put_pixel_all(
		geometri.layangLayang(
			50,
			100,
			75,
			Vector2(20,210)
		),
		Color.skyblue
	)
	garis.put_pixel_all(
		geometri.layangLayang(
			50,
			100,
			75,
			Vector2(80,210)
		),
		Color.yellow,
		10,
		"dash-dash"
	)
	
	garis.put_pixel_all(
		geometri.trapesium(
			100,
			50,
			50,
			Vector2(20,140)
		),
		Color.skyblue
	)
	garis.put_pixel_all(
		geometri.trapesium(
			100,
			50,
			50,
			Vector2(140,140)
		),
		Color.yellow,
		"dash-dash"
	)
	
	garis.put_pixel_all(
		geometri.trapesium(
			100,
			50,
			50,
			Vector2(260,140),
			"sama-kaki"
		),
		Color.skyblue
	)
	garis.put_pixel_all(
		geometri.trapesium(
			100,
			50,
			50,
			Vector2(380,140),
			"sama-kaki"
		),
		Color.yellow,
		"dash-dash"
	)
	
	garis.put_pixel_all(
		geometri.lingkaran(
			25,
			Vector2(520,120)
		),
		Color.skyblue
	)
	garis.put_pixel_all(
		geometri.lingkaran(
			25,
			Vector2(590,120)
		),
		Color.yellow,
		10,
		"dash-dash"
	)
	
	garis.put_pixel_all(
		geometri.ellipse(
			35,
			25,
			Vector2(670,120)
		),
		Color.skyblue
	)
	garis.put_pixel_all(
		geometri.ellipse(
			35,
			25,
			Vector2(760,120)
		),
		Color.yellow,
		10,
		"dash-dash"
	)
	
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().change_scene("res://Scene/MainPage.tscn")
	pass # Replace with function body.
