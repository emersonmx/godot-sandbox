extends Node2D

var speed = 200

func _ready():
    pass

func _physics_process(delta):
    var velocity = _get_input_velocity()

    position += velocity.normalized() * speed * delta

func _get_input_velocity():
    var velocity = Vector2()

    if Input.is_action_pressed('move_up'):
        velocity.y = -1
    elif Input.is_action_pressed('move_down'):
        velocity.y = 1
    if Input.is_action_pressed('move_left'):
        velocity.x = -1
    elif Input.is_action_pressed('move_right'):
        velocity.x = 1

    return velocity
