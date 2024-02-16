extends Node

@export var num_players = 4
@export var player_names = ["Jogador 1", "Jogador 2", "Jogador 3", "Jogador 4"]
@export var player_money = [0, 0, 0, 0]
#índice corresponde ao jogador; exemplo: caminho[0] = 1 significa que o jogador 1 segue caminho Diamante
@export var caminho = [0, 0, 0, 0]

@export var flag_caminho = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_num_players(num_players_selected):
	num_players = num_players_selected

func set_player_name(player, name):
	player_names[player] = name

