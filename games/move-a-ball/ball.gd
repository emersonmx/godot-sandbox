extends KinematicBody2D

var speed = 200
var velocity = Vector2()

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	var horizontal = Input.is_action_pressed("ui_right") - Input.is_action_pressed("ui_left")
	var vertical = Input.is_action_pressed("ui_down") - Input.is_action_pressed("ui_up")
	var direction = Vector2(horizontal, vertical)

	velocity = speed * direction.normalized() * delta
	move(velocity)