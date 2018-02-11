extends TileMap

const MARK = 0

func mark_cell(position):
    set_cellv(position, _get_mark_tile_id())

func clear_cell(position):
    set_cellv(position, INVALID_CELL)

func is_cell_empty(position):
    return get_cellv(position) == INVALID_CELL

func _get_mark_tile_id():
    return 0
