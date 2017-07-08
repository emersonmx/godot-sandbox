extends KinematicBody2D

const MIN_HALF_WIDTH = 30
const MAX_HALF_WIDTH = 300
const MIN_ANGLE = 1
const MAX_ANGLE = 89

var extents = Vector2(50, 10)
var angle = 30

var width_label
var angle_label

func _ready():
	width_label = get_node("/root/world/width_label")
	angle_label = get_node("/root/world/angle_label")

	set_process(true)

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		extents.x -= 200 * delta
		extents.x = MIN_HALF_WIDTH if extents.x < MIN_HALF_WIDTH else extents.x
		update()
	elif Input.is_action_pressed("ui_right"):
		extents.x += 200 * delta
		extents.x = MAX_HALF_WIDTH if extents.x > MAX_HALF_WIDTH else extents.x
		update()
	if Input.is_action_pressed("ui_up"):
		angle += 45 * delta
		angle = MAX_ANGLE if angle > MAX_ANGLE else angle
		update()
	elif Input.is_action_pressed("ui_down"):
		angle -= 45 * delta
		angle = MIN_ANGLE if angle < MIN_ANGLE else angle
		update()

	angle_label.set_text("Angle: " + str(angle))
	width_label.set_text("Width: " + str(extents.x * 2))

func _draw():
	var tri_height = calc_height(extents.x * 2, angle)

	# Rect
	draw_line(Vector2(-extents.x, 0), Vector2(extents.x, 0), Color(255, 255, 255), 1)
	draw_line(Vector2(-extents.x, 0), Vector2(-extents.x, extents.y*2), Color(255, 255, 255), 1)
	draw_line(Vector2(extents.x, 0), Vector2(extents.x, extents.y*2), Color(255, 255, 255), 1)
	draw_line(Vector2(-extents.x, extents.y*2), Vector2(extents.x, extents.y*2), Color(255, 255, 255), 1)

	# Height
	draw_line(Vector2(0, 0), Vector2(0, tri_height), Color(255, 255, 0), 2)

	# Angle
	draw_line(Vector2(0, tri_height), Vector2(-extents.x, 0), Color(255, 255, 0), 2)
	draw_line(Vector2(0, tri_height), Vector2(extents.x, 0), Color(255, 255, 0), 2)

func calc_height(base, angle=30):
	return (base / 2.0) * tan(deg2rad(angle))