extends TileMap

export var mark_tile_id = 0

var half_cell_size = self.cell_size / 2

func mark_cell(position):
    set_cellv(position, mark_tile_id)

func clear_cell(position):
    set_cellv(position, INVALID_CELL)

func is_cell_empty(position):
    return get_cellv(position) == INVALID_CELL
