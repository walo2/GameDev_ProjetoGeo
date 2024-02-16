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
		new_player.name = GlobalData.player_names[i]
		add_child(new_player)
		print("player ", i, " - ", new_player.name, " criado")
