extends KinematicBody2D

const ACCELRATION: float = 60.0
const MAX_SPEED: float = 100.0
const ROTATION_SPEED: float = 180.0

var velocity: Vector2 = Vector2.ZERO

func _ready():
	pass

func _process(time):
	if Input.is_action_pressed("ui_up"):
		var y_acceleraion = -cos(rotation) * ACCELRATION * time
		var x_acceleraion = sin(rotation) * ACCELRATION * time
		velocity.x += x_acceleraion
		velocity.y += y_acceleraion

	if Input.is_action_pressed("ui_left"):
		rotation_degrees -= ROTATION_SPEED * time
		if rotation_degrees < -360:
			rotation_degrees += 360

	if Input.is_action_pressed("ui_right"):
		rotation_degrees += ROTATION_SPEED * time
		if rotation_degrees > 360:
			rotation_degrees -= 360

	move_and_slide(velocity)
