extends Node

onready var face_scene = preload('res://face.tscn')

func _ready():
	set_process_input(true)

func _input(event):
	if event.type != InputEvent.MOUSE_BUTTON: return
	if not event.is_pressed(): return
	if event.button_index == BUTTON_LEFT:
		var face = face_scene.instance()
		add_child(face)
		face.set_pos(event.pos)