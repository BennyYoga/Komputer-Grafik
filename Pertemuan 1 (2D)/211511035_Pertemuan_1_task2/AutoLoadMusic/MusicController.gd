extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var music = load("res://Assets/Music/MainMusic.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func play_music():

	$Music.stream = music
	$Music.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
