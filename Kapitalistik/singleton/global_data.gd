extends Node

@export var num_players = 4
@export var player_names = ["Jogador 1", "Jogador 2", "Jogador 3", "Jogador 4"]
@export var player_money = [0, 0, 0, 0]
#índice corresponde ao jogador; exemplo: caminho[0] = 1 significa que o jogador 1 segue caminho Diamante
@export var caminho = [0, 0, 0, 0]

@export var flag_caminho = false #sinaliza que os caminhos Diamante e Ferro já foram determinados

var fase = 0
#var numPlayers = 4
var playerTurn = 0
var numeroSorteado = 0
var TileInicial
var pularTurno = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if fase == 0 or fase == 3:
		proximaFase()
	pass

func set_num_players(num_players_selected):
	num_players = num_players_selected

func set_player_name(player, name):
	player_names[player] = name


func proximaFase():
	fase = (fase+1) % 4
	if fase == 0:
		fimTurno()
	if playerTurn in pularTurno:
		pularTurno.erase(playerTurn)
		fimTurno()

func numeroRoleta(numero):
	if numero == 1:
		numeroSorteado = 0
		proximaFase()
	elif numero == 2:
		numeroSorteado = 2
	elif numero == 3:
		numeroSorteado = 3
	elif numero == 4:
		numeroSorteado = -2
		pularTurno.append(playerTurn)
	elif numero == 5:
		numeroSorteado = 4
	elif numero == 6:
		numeroSorteado = 1

func fimTurno():
	playerTurn = (playerTurn+1) % num_players
	fase = 0
