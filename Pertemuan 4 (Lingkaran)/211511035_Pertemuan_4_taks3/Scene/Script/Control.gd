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
			geometri.ellipse(
				120,
				200,
				Vector2(garis.centerX,garis.centerY-50)
			),
			Color.yellow
		)
		garis.put_pixel_all(
			geometri.ellipse(
				200,
				120,
				Vector2(garis.centerX-50,garis.centerY)
			),
			Color.yellow
		)
		garis.put_pixel_all(
			geometri.ellipse(
				120,
				200,
				Vector2(garis.centerX,garis.centerY+50)
			),
			Color.yellow
		)
		garis.put_pixel_all(
			geometri.ellipse(
				200,
				120,
				Vector2(garis.centerX+50,garis.centerY)
			),
			Color.yellow
		)
		garis.put_pixel_all(
			geometri.lingkaran(
				50,
				Vector2(garis.centerX,garis.centerY)
			),
			Color.yellow
		)
		garis.put_pixel_all(
			geometri.lingkaran(
				100,
				Vector2(garis.centerX,garis.centerY)
			),
			Color.yellow
		)
		pass

func _on_Button_pressed():
	get_tree().change_scene("res://Scene/MainPage.tscn")
	pass # Replace with function body.
