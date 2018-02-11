extends Node

var grid

func _enter_tree():
    grid = $grid

    $player.game = self