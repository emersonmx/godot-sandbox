extends TileMap

enum Tile {
    EMPTY = -1, OBSTACLE
}

func clear_cell(position):
    set_cellv(position, EMPTY)

func block_cell(position):
    set_cellv(position, OBSTACLE)

func is_cell_empty(position):
    return get_cellv(position) == EMPTY
