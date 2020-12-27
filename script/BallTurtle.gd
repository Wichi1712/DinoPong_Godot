extends Area2D

var posIni
var dirX = 0
var dirY = 400
var direccion = Vector2.ZERO
var move = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	posIni = get_viewport_rect().size
	position.x = posIni.x/2
	position.y = posIni.y - 200
	
	direccion = Vector2(dirX,-dirY)
	global_var.stateBall = "stop"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#position -= direccion * delta
	#Movimimiento y traslacion
	if global_var.stateBall == "stop":
		position.x = global_var.posPlayer
	
	
	if global_var.stateBall == "move":
		direccion.x = dirX
		#move = move_and_slide(direccion)
		
		position += direccion * delta
		
		#Rebote horizontal
		if position.x < 100:
			dirX = 400
		if position.x > 380:
			dirX = -400
		#Rebote vertical
		if position.y < 0:
			direccion.y = dirY# * delta
		if position.y > 500:
			direccion.y = -dirY# * delta
			
			
		#print("ball" + str(dirX))
	
