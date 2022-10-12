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
func delapanLingkaran(center : Vector2, radius):
	var centerAccent = Vector2()
	centerAccent = center
	garis.put_pixel_all(
				geometri.lingkaran(
					50,
					centerAccent
				),
				Color.red
			)
	centerAccent = center
	centerAccent.x = center.x
	centerAccent.y = center.y + radius
	garis.put_pixel_all(
				geometri.lingkaran(
					50,
					centerAccent
				),
				Color.red
			)
	centerAccent = center
	centerAccent.x = center.x + radius
	centerAccent.y = center.y
	garis.put_pixel_all(
				geometri.lingkaran(
					50,
					centerAccent
				),
				Color.red
			)
	centerAccent = center
	centerAccent.x = center.x - radius
	centerAccent.y =  center.y
	garis.put_pixel_all(
				geometri.lingkaran(
					50,
					centerAccent
				),
				Color.red
			)
	centerAccent = center
	centerAccent.x = center.x
	centerAccent.y = center.y - radius
	garis.put_pixel_all(
				geometri.lingkaran(
					50,
					centerAccent
				),
				Color.red
			)
	pass

func _on_Control_draw():
	var center = Vector2()
	center.x = 500
	center.y = 300
	var radius = 50
	
	delapanLingkaran(center,radius)
	center.x +=150
	delapanLingkaran(center,radius)
	center.x -=300
	delapanLingkaran(center,radius)
	center.y +=150
	delapanLingkaran(center,radius)
	center.y -=300
	delapanLingkaran(center,radius)
	center.x +=150
	delapanLingkaran(center,radius)
	center.y +=300
	delapanLingkaran(center,radius)
	center.y -=300
	delapanLingkaran(center,radius)
	center.x +=150
	delapanLingkaran(center,radius)
	center.y +=300
	delapanLingkaran(center,radius)
	center.y -=300
	delapanLingkaran(center,radius)
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().change_scene("res://Scene/MainPage.tscn")
	pass # Replace with function body.
