extends TileMap

const MARK = 0

func mark_cell(position):
    set_cellv(position, MARK)

func clear_cell(position):
    set_cellv(position, INVALID_CELL)

func is_cell_empty(position):
    return get_cellv(position) == INVALID_CELL
