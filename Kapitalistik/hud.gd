extends CanvasLayer

@onready var holder = [$VBoxContainer/Holder, $VBoxContainer/Holder2, $VBoxContainer/Holder3, $VBoxContainer/Holder4]




# Called when the node enters the scene tree for the first time.
func _ready():
	holder[0].visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


