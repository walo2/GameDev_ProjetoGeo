extends Node2D

class_name PlayerTemp

var drag = false
var offset = Vector2(0,0)
var posicaoAtual = 1
var posicaoInicial
var noTile = true

@onready var area2D = $Area2D

@export var colorPlayer : Color
@export var playerId : int = 0
@export var caminho = 0 #1 = diamante, 2 = ferro
@export var player_name = "player"
@export var money = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("ColorPlayer").color = colorPlayer
	Controlador.TileInicial.inicioJogo(self)
	posicaoInicial = position
	pass # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if drag:
		position = get_global_mouse_position() - offset
	pass

func _on_button_button_down():
	if Controlador.playerTurn == playerId and Controlador.fase == 2:
		posicaoInicial = position
		drag = true
		offset = get_global_mouse_position() - global_position


func _on_button_button_up():
	drag = false
	if noTile == false:
		position = posicaoInicial

func newPosition(x,y):
	position.x = x
	position.y = y


func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	noTile = true
	pass # Replace with function body.


func _on_area_2d_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	noTile = false
	pass # Replace with function body.

func add_money(value):
	money += value
	GlobalData.player_money[playerId] = money
	
func sub_money(value):
	money -= value
	GlobalData.player_money[playerId] = money
