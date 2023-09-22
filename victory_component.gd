extends Node2D

@onready var current_player = Constant.Player.PLAYER_1

# Called when the node enters the scene tree for the first time.
func _ready():
	Constant.turn_change.connect(turn_change)

func turn_change(slot, index, old_player_turn, new_player_turn):
	get_parent().get_dictionary()[index] = old_player_turn
	self.current_player = new_player_turn
	game_won(index, old_player_turn)
	
func game_won(index, player_turn):
	#check row
	for x in range(Constant.board_size):
		var val = get_parent().get_dictionary().get(Vector2(x, index.y), -1)
		if val != player_turn:
			break
		elif x == Constant.board_size - 1:
			print("winner ", player_turn)
	
	#check col
	for y in range(Constant.board_size):
		var val = get_parent().get_dictionary().get(Vector2(index.x, y), -1)
		if val != player_turn:
			break
		elif y == Constant.board_size - 1:
			print("winner ", player_turn)
	
	#check diag
	if (index.x == index.y):
		for i in range(Constant.board_size):
			var val = get_parent().get_dictionary().get(Vector2(i, i), -1)
			if val != player_turn:
				break
			elif i == Constant.board_size - 1:
				print("winner ", player_turn)
				
	#check anti-diag
	if (index.x + index.y == Constant.board_size - 1):
		for i in range(Constant.board_size):
			var val = get_parent().get_dictionary().get(Vector2(i, Constant.board_size - 1 - i), -1)
			if val != player_turn:
				break
			elif i == Constant.board_size - 1:
				print("winner ", player_turn)
