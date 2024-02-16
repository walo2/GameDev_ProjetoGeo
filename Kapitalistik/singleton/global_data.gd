extends Node

@export var num_players = 2
@export var player_names = ["1", "2", "3", "4"]
@export var player_money = [0, 0, 0, 0]

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

