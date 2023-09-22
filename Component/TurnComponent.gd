extends Node2D

@onready var turn = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Constant.box_clicked.connect(turn_change)
	
func turn_change(slot, index):
	if Constant.is_game_finished :
		return
	if get_parent().get_dictionary().has(index):
		return
	var new_turn = (turn + 1) % Constant.Player.size()
	Constant.turn_change.emit(slot, index, turn, new_turn)
	turn = new_turn
