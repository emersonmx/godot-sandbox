extends 'player.gd'

const DIRECTION_THRESHOLD = 0.5

var navigation
var path = []
var goal_position

func _ready():
    path = navigation.get_simple_path(position, goal_position, true)
    for p in path:
        prints(grid.world_to_map(p - grid.half_cell_size))

func get_input_direction():
    var next_grid_position = _get_next_grid_position()
    if grid_position == next_grid_position:
        if path.size() > 0:
            path.remove(0)
        return Vector2()

    var diff_direction = (next_grid_position - grid_position).normalized()
    if diff_direction.dot(UP) > DIRECTION_THRESHOLD:
        return UP
    elif diff_direction.dot(DOWN) > DIRECTION_THRESHOLD:
        return DOWN

    if diff_direction.dot(LEFT) > DIRECTION_THRESHOLD:
        return LEFT
    elif diff_direction.dot(RIGHT) > DIRECTION_THRESHOLD:
        return RIGHT

    return Vector2()

func _get_next_position():
    return path[0] - grid.half_cell_size if path.size() > 0 else goal_position

func _get_next_grid_position():
    return grid.world_to_map(_get_next_position())

func _get_next_input_direction():
    return _get_next_grid_position() - grid_position