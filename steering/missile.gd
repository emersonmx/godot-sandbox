extends KinematicBody2D

export(String, 'direct', 'seek') var mode = 'direct'

var speed = 10
var target_motion = Vector2()
var motion = Vector2()
var steering = Vector2()

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if mode == 'direct':
		_direct(delta)
	elif mode == 'seek':
		_seek(delta)

func _get_target_motion():
	return (get_viewport().get_mouse_pos() - get_pos()).normalized()

func _direct(delta):
	var position = get_pos()
	motion = _get_target_motion()
	position += motion * speed
	set_pos(position)

func _seek(delta):
	var mass = 100
	var position = get_pos()
	target_motion = _get_target_motion() * speed
	steering = target_motion - motion
	steering = steering.clamped(speed)
	steering = steering / mass
	motion = (motion + steering).clamped(speed)
	position += motion
	set_pos(position)

