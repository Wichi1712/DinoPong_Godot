extends KinematicBody2D

var SPEED = 90

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	position.y +=SPEED *delta
	
	#Vuelve a la posicion inicial
	if position.y > global_var.screenSize.y + 60:
		randomize()
		position.x = rand_range(75,global_var.screenSize.x - 75)
		position.y = rand_range(-60,-560)


func hit():
	global_var.score +=1
	queue_free()
