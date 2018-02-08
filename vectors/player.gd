extends Sprite

var size = get_texture().get_size()
onready var screen_size = get_viewport().get_rect().size

var speed = 300
var jump_speed = 1000

var velocity = Vector2(1, 0)  * speed
var gravity = Vector2(0, 1) * 1000

func _ready():
	set_process(true)

func _process(delta):
	# s = s0 + vt
	# v = v0 + at
	var position = get_pos()
	if position.y + size.y/2 > screen_size.y:
		velocity.y = -jump_speed
	if position.x + size.x/2 > screen_size.x:
		velocity.x = -speed
	if position.x - size.x/2 < 0:
		velocity.x = speed

	velocity = velocity + gravity * delta # V = V0 + at
	position = position + velocity * delta # S = S0 + vt
	set_pos(position)
