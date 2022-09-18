extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Scene 1/Task 1.tscn")


func _on_Week3_pressed():
	get_tree().change_scene("res://Week 3/Week 3 taks 6.tscn")
	pass # Replace with function body.
