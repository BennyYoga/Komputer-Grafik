extends "res://Scene 1/Geometrik.gd";


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _on_Control_draw():
	border()	
	kartesian()
	linear()
	kuadrat()
	trigonometri()
	
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().change_scene("res://MainPage/Control.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://Scene 2/Scene2.tscn")
