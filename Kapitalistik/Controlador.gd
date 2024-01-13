extends Node

# fases Inicio do turno = 0, roleta: 1, movimento: 2, fim do turno: 3
var fase = 0
var numPlayers = 4
var playerTurn = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func proximaFase():
	fase = (fase+1) % 4
	if fase == 0:
		fimTurno()


func fimTurno():
	playerTurn = (playerTurn+1) % numPlayers
