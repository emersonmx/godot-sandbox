extends Node2D

const UP = Vector2(0, -1)
const RIGHT = Vector2(1, 0)
const DOWN = Vector2(0, 1)
const LEFT = Vector2(-1, 0)

var speed = 200
var direction = Vector2()
var grid_position = Vector2()
var target_position = Vector2()
var clear_position = Vector2()
var is_moving = false

onready var game = get_parent()

func _ready():
    grid_position = game.grid.world_to_map(position)
    game.grid.block_cell(grid_position)

func _physics_process(delta):
    update_grid_position()
    move(delta)

func move(delta):
    if not is_moving:
        return

    var velocity = direction * speed * delta
    var distance_to_target = position.distance_to(target_position)
    var move_distance = velocity.length()
    if move_distance > distance_to_target:
        game.grid.clear_cell(clear_position)
        velocity = direction * distance_to_target
        is_moving = false
    position += velocity

func update_grid_position():
    if is_moving:
        return

    var input_direction = get_input_direction()

    var new_grid_position = grid_position + input_direction
    if game.grid.is_cell_empty(new_grid_position):
        game.grid.block_cell(grid_position)
        game.grid.block_cell(new_grid_position)
        target_position = game.grid.map_to_world(new_grid_position, true)
        clear_position = grid_position
        grid_position = new_grid_position
        direction = input_direction.normalized()
        is_moving = true

func get_input_direction():
    if Input.is_action_pressed('up'):
        return UP
    elif Input.is_action_pressed('down'):
        return DOWN
    if Input.is_action_pressed('left'):
        return LEFT
    elif Input.is_action_pressed('right'):
        return RIGHT
    return Vector2()