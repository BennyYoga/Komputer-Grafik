extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("fade in")
	yield(get_tree().create_timer(3), "timeout")
	$AnimationPlayer.play("fade out")
	yield(get_tree().create_timer(3), "timeout")
	get_tree().change_scene("res://Main Page/Main Page.tscn")
	pass # Replace with function body.
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
