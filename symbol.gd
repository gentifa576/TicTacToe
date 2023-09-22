extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimationPlayer").play("placed")
	get_node("AudioStreamPlayer").play(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
