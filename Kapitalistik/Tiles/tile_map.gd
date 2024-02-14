extends Node2D


var players = preload("res://player_temp.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	instantiate_players()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func instantiate_players():
	for i in GlobalData.num_players:
		var new_player = players.instantiate()
		new_player.player_name = GlobalData.player_names[i]
		new_player.playerId = i
		if (i == 0 || i == 2):
			new_player.caminho = 1
		else:
			new_player.caminho = 2
		add_child(new_player)
		print(new_player.player_name, ", id: ", new_player.playerId, ", caminho: ", new_player.caminho)
