extends Node2D

@export var lineSprite = preload("res://line_sprite.tscn")
@export var slot = preload("res://slot.tscn")

var width = 8
var height = 64
var gap_size = height

@onready var width_offset = Constant.scale_ratio * width
@onready var height_offset = Constant.scale_ratio * height

# Called when the node enters the scene tree for the first time.
func _ready():
	draw_vertical_line()
	draw_horizontal_line()
	place_slot()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func draw_vertical_line():
	for y in range (Constant.board_size):
		for x in range(Constant.board_size - 1):
			var line = lineSprite.instantiate()
			var x_val = gap_size + width_offset / 2 + x * gap_size + x * width_offset
			var y_val = height_offset / 2 + y * width_offset + y * height_offset
			line.position = Vector2(x_val, y_val)
			line.scale = Vector2(Constant.scale_ratio, Constant.scale_ratio)
			add_child(line)

func draw_horizontal_line():
	for x in range(Constant.board_size):
		for y in range(Constant.board_size - 1):
			var line = lineSprite.instantiate()
			var x_val = height_offset / 2 + x * width_offset + x * height_offset
			var y_val = gap_size + width_offset / 2 + y * gap_size + y * width_offset
			line.position = Vector2(x_val, y_val)
			line.scale = Vector2(Constant.scale_ratio, Constant.scale_ratio)
			line.rotation_degrees = 90
			add_child(line)
			
func place_slot():
	for x in range(Constant.board_size):
		for y in range(Constant.board_size):
			var s = slot.instantiate()
			s.init(Vector2(x, y))
			s.position = Vector2(x * (gap_size + width_offset) + gap_size / 2, y * (gap_size + width_offset) + gap_size / 2)
			add_child(s)
	Constant.game_created.emit(Constant.board_size)
