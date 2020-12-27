extends Area2D

var screenSize
var speed = 230
#var direction = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	OS.center_window()
	#Posicion inicial
	screenSize = get_viewport_rect().size
	position.x = screenSize.x / 2
	position.y = screenSize.y - 150


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	#MOVE
	if Input.is_action_pressed("ui_left"):
		position.x -= speed * delta
	if Input.is_action_pressed("ui_right"):
		position.x += speed * delta
		
		
	#Damos movimiento al balon
	if Input.is_action_pressed("patear") && global_var.stateBall == "stop":
		global_var.stateBall = "move"
		
		#TEST
		#Verifica si la instancia existe
		if(is_instance_valid(get_node("../RedBall"))):
			get_node("../RedBall").moveBall()
		
	#guardamos en la variable global la posicion de Player
	if global_var.stateBall == "stop":
		global_var.posPlayer = position.x
		
	#LIMITES DE MOVIMIENTO
	position.x = clamp(position.x,0,screenSize.x)
	position.y = clamp(position.y,0,screenSize.y)
	
	#print("PLAYER: " + str(screenSize))


func _on_Player_area_entered(area):
	if area.is_in_group("Dinos"):
		global_var.numLifes -=1
		#queue_free()
