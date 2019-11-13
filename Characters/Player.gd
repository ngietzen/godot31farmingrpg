extends "res://Characters/Character.gd"

func _physics_process(delta: float) -> void:
	
	# Update Input
	var input_left = Input.is_action_pressed("left")
	var input_right = Input.is_action_pressed("right")
	var input_up = Input.is_action_pressed("up")
	var input_down = Input.is_action_pressed("down")
	var input_walk = Input.is_action_pressed("walk")
	var input_run = Input.is_action_pressed("run")
	
	# Reset Move
	var moveX = 0
	var moveY = 0
	
	# Alter Speed
	if input_walk or input_run:
		speed = abs((int(input_walk) * walking_speed) - (int(input_run) * run_speed))
	else:
		speed = normal_speed
	
	# Intended Movement
	moveY = (int(input_down) - int(input_up)) * speed
	if moveY == 0:
		moveX = (int(input_right) - int(input_left)) * speed
	
	# Apply Movement
	move_and_slide(Vector2(moveX, moveY))