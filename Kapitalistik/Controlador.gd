extends Node

# fases: Inicio do turno = 0, roleta: 1, movimento: 2, fim do turno: 3
var fase = 0
var numPlayers = 4
var playerTurn = 0
var numeroSorteado = 0
var TileInicial

# Called when the node enters the scene tree for the first time.
func _ready():
	print(GlobalData.num_players)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if fase == 0 or fase == 3:
		proximaFase()
	pass

func proximaFase():
	fase = (fase+1) % 4
	if fase == 0:
		fimTurno()

func numeroRoleta(numero):
	if numero == 1:
		numeroSorteado = 1
	elif numero == 2:
		numeroSorteado = 0
		proximaFase()
	elif numero == 3:
		numeroSorteado = 2
	elif numero == 4:
		numeroSorteado = 3
	elif numero == 5:
		numeroSorteado = 0
		proximaFase()
	elif numero == 6:
		numeroSorteado = 4

func fimTurno():
	playerTurn = (playerTurn+1) % numPlayers
