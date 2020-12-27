extends KinematicBody2D

var speed = 230

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)


func move(delta):
	#MOVE
	if Input.is_action_pressed("ui_left"):
		position.x -= speed * delta
		$Sprite.flip_h = true
		if global_var.stateBall == "stop":
			$AnimationPlayer.play("ChargerWalk")
		elif global_var.stateBall == "move":
			$AnimationPlayer.play("walk")
	elif Input.is_action_pressed("ui_right"):
		position.x += speed * delta
		$Sprite.flip_h = false
		if global_var.stateBall == "stop":
			$AnimationPlayer.play("ChargerWalk")
		elif global_var.stateBall == "move":
			$AnimationPlayer.play("walk")
	else:
		if global_var.stateBall == "stop":
			$AnimationPlayer.play("stopCharge")
		elif global_var.stateBall == "move":
			$AnimationPlayer.play("stop")
		
	
#	if global_var.stateBall == "stop":
#		if Input.is_action_pressed("ui_left"):
#			position.x -= speed * delta
#			$AnimationPlayer.play("ChargerWalk")
#			$Sprite.flip_h = true
#		elif Input.is_action_pressed("ui_right"):
#			position.x += speed * delta
#			$AnimationPlayer.play("ChargerWalk")
#			$Sprite.flip_h = false
#		else:
#			$AnimationPlayer.play("stopCharge")
#
#	if global_var.stateBall == "move":
#		if Input.is_action_pressed("ui_left"):
#			position.x -= speed * delta
#			$AnimationPlayer.play("walk")
#			$Sprite.flip_h = true
#		elif Input.is_action_pressed("ui_right"):
#			position.x += speed * delta
#			$AnimationPlayer.play("walk")
#			$Sprite.flip_h = false
#		else:
#			$AnimationPlayer.play("stop")
		
		
	#LIMITES DE MOVIMIENTO
	position.x = clamp(position.x,0,get_parent().screenSize.x)
	position.y = clamp(position.y,0,get_parent().screenSize.y)


#func shoot():
#	if Input.is_action_just_pressed("patear"):
#		if global_var.stateBall == "stop":
#			get_node("../RedBall").moveBall()

func hit():
	print("ballDron COLISIONO")
	global_var.stateBall = "stop"
