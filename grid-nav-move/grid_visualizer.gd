extends Node2D

export var grid = Vector2(25, 25)
export var tile_size = Vector2(32, 32)
export var line_color = Color(255, 255, 255)
export var line_width = 2

func _draw():
    for x in range(grid.x + 1):
        var col_pos = x * tile_size.x
        var limit = grid.y * tile_size.y
        draw_line(Vector2(col_pos, 0), Vector2(col_pos, limit), line_color, line_width)
    for y in range(grid.y + 1):
        var row_pos = y * tile_size.y
        var limit = grid.x * tile_size.x
        draw_line(Vector2(0, row_pos), Vector2(limit, row_pos), line_color, line_width)
