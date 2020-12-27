extends Node

var screenSize = Vector2()
var numeroDinos = 10
var numBalls = 3
var Dino = preload("res://scenes/dinos/Dino.tscn")
var TestDino = preload("res://scenes/dinos/TestDino.tscn")

func _ready():
	OS.center_window()#centrar ventana
	#Obtenemos tamaño de la ventana
	screenSize = get_viewport().get_visible_rect().size
	global_var.estadoJuego = "jugando"
	global_var.screenSize = screenSize


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Valor inicial del ball en el eje X
	#Se comprueba que la instancia BallTurtle exista
	if global_var.stateBall == "stop" && is_instance_valid($BallTurtle):
		if Input.is_action_pressed("ui_left"):
			$BallTurtle.dirX = -400
		if Input.is_action_pressed("ui_right"):
			$BallTurtle.dirX = 400
	#pass
	print("ball: " + global_var.stateBall)
	#print("SCREEN: " + str(screenSize))
	
	#Actualiza HUD
	$HUD/MarginContainer/Score.text = "Score " + str(global_var.score)
	$HUD/MarginContainer/Life.text = "Life " + str(global_var.numLifes)
	
#	if $ContenEnenigo.get_child_count() == 0:
#		level+=1
#		time_left += 5
#		spawn_enemigo()#llama a la funcion spawn_enemigo
#
#	#Crea enemigos en posicion aleatoria
#	func spawn_enemigo():
#		for index in range(BASIC_LEVEL + level):
#			var Enemy = Enemigo.instance()
#			Enemy.position = Vector2(rand_range(0,screensize.x), rand_range(0,screensize.y))
#			$ContenEnenigo.add_child(Enemy)


	if $ContenDinos.get_child_count() == 0:
		crea_dinos()

#Crea enemigos en posicion aleatoria
func crea_dinos():
#	for index in range(numeroDinos):
#		var dino = Dino.instance()
#		randomize()
#		dino.position = Vector2(rand_range(-0,screenSize.x - 60),rand_range(-60,-560))
#		$ContenDinos.add_child(dino)
		
		
	#CREACION DE TestDinos solo para prueba
	for i in range(numeroDinos):
		var tstDino = TestDino.instance()
		randomize()
		tstDino.position = Vector2(rand_range(-0,screenSize.x - 60),rand_range(-60,-560))
		$ContenDinos.add_child(tstDino)
