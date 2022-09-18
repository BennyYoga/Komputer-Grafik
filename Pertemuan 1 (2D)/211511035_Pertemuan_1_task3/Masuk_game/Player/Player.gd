extends Area2D


export var speed:float = 200
var vel := Vector2(0,0)

onready var animatedSprite := $AnimatedSprite

func _process(delta):
	if vel.x < 0 || vel.y < 0:
		animatedSprite.play("Run-left")
	elif vel.x > 0 || vel.y > 0:
		animatedSprite.play("Run")
	else:
		animatedSprite.play("Stay")
	
func _physics_process(delta):
	var dirVel = Vector2(0,0)
	
	if Input.is_action_pressed("ui_down"):
		dirVel.y =+1
	if Input.is_action_pressed("ui_up"):
		dirVel.y =-1
	if Input.is_action_pressed("ui_left"):
		dirVel.x =-1
	if Input.is_action_pressed("ui_right"):
		dirVel.x =+1
	if Input.is_action_pressed("spasi"):
		animatedSprite.play("Attack")
	
	vel = dirVel.normalized() * speed
	position += vel*delta 
	
	var viewRect := get_viewport_rect()
	position.x = clamp(position.x , 0 , viewRect.size.x)
	position.y = clamp(position.y , 0 , viewRect.size.y)
