extends KinematicBody2D


var velocity = Vector2(250, 250)

func _ready():
	global_var.stateBall = "stop"

func _physics_process(delta):
	moveBall(delta)
	#Rebote
#	if global_var.stateBall == "move":
#		var collision = move_and_collide(velocity * delta)
#		if collision:
#			velocity = velocity.bounce(collision.normal)
#			#Detiene movimiento cuando colisiona con player
#			if collision.collider.has_method("hit"):
#				collision.collider.hit()
#
#	if global_var.stateBall == "stop":
#		position.x = get_parent().get_node("TestPlayer").position.x
#		position.y = get_node("../TestPlayer").position.y - 30

func moveBall(delta):
	match global_var.stateBall:
		"stop":
			position.x = get_parent().get_node("TestPlayer").position.x
			position.y = get_node("../TestPlayer").position.y - 30
			
		"move":
			var collision = move_and_collide(velocity * delta)
			if collision:
				velocity = velocity.bounce(collision.normal)
				#Detiene movimiento cuando colisiona con player
				if collision.collider.has_method("hit"):
					collision.collider.hit()
			
			#Volvemos a la posicion inicial mediante el estado de ball
			#que cambia a "stop" mientras el numero de balls sea mayor a cero de lo contrario sera
			#eliminado al sobrepasar el alto de la pantalla.
			if position.y > global_var.screenSize.y + 10:
				get_parent().get_node("../Game").numBalls -=1
				if get_parent().get_node("../Game").numBalls > 0:
					global_var.stateBall = "stop"
				else:
					queue_free()
				
