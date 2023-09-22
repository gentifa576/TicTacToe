extends Node2D

@export var x_img = preload("res://X.png")
@export var o_img = preload("res://O.png")
@export var symbol_scene = preload("res://symbol.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	Constant.turn_change.connect(turn_change)


func turn_change(slot, index, old_player_turn, new_player_turn):
	var instance = symbol_scene.instantiate()
	var texture
	match old_player_turn:
		Constant.Player.PLAYER_1:
			texture = x_img
		Constant.Player.PLAYER_2:
			texture = o_img
	instance.texture = texture
	slot.add_child(instance)
	print(instance, " ", texture, " ", instance.texture)
	pass
