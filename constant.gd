extends Node
enum Player {PLAYER_1 = 0, PLAYER_2 = 1}

signal box_clicked(slot, index)
signal game_created(size)
signal turn_change(slot, index, old_player_turn, new_player_turn)

var board_size: int = 3
var scale_ratio: float = 1.0
