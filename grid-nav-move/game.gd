extends Node

var grid

func _enter_tree():
    grid = $grid

    $player.grid = grid
    $player.navigation = $navigation
    $player.goal_position = grid.map_to_world(Vector2(23, 17), true) + grid.half_cell_size
