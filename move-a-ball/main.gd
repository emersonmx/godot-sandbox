extends Node2D

func _ready():
	var game_area = get_node("game_area")
	game_area.connect("body_exit", self, "_kill_bodies")

func _kill_bodies(body):
	if body.get_name() == "ball":
		print("GameOver")
		body.queue_free()