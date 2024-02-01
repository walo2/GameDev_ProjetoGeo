extends Node2D


var drag = false
var offset = Vector2(0,0)

@export var colorPlayer : Color
@export var playerId = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("ColorPlayer").color = colorPlayer
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if drag:
		position = get_global_mouse_position() - offset
	pass

func _on_button_button_down():
	if Controlador.playerTurn == playerId and Controlador.fase == 2:
		drag = true
		offset = get_global_mouse_position() - global_position


func _on_button_button_up():
	drag = false

func newPosition(x,y):
	position.x = x
	position.y = y
