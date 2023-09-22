extends Node2D

var filled_by: Constant.Player
var index: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func init(index):
	self.index = index

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_static_body_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.pressed:
		Constant.box_clicked.emit(self, index)
