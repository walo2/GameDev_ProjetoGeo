extends CanvasLayer


var holder = [$VBoxContainer/Holder, $VBoxContainer/Holder2, $VBoxContainer/Holder3, $VBoxContainer/Holder4]

#de alguma forma pegar a quantidade de players
#@onready var qnt_players;


#var holderUsers = {
#	jogador1: 'VBoxContainer/Holder/User.text',
#	jogador2: 'VBoxContainer/Holder2/User.text',
#	jogador3: 'VBoxContainer/Holder3/User.text',
#	jogador4: 'VBoxContainer/Holder4/User.text'
#}

#@onready var holderUsers = [VBoxContainer/Holder/User.text, VBoxContainer/Holder2/User, VBoxContainer/Holder3/User, VBoxContainer/Holder4/User]
#var nome_players = ["nome1", "nome2", "nome3", "nome4"]


# fazer algo pra settar o nome dos jogadores e atualizar os saldos

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#if qnt_players == 2: # se a quantidade de players for 2 
	#	holder[0].visible = true
	#	holder[1].visible = true
	#	holder[2].visible = false
	#	holder[3].visible = false
	#elif qnt_players == 3: # se a quantidade de players for 3
	#	holder[0].visible = true
	#	holder[1].visible = true
	#	holder[2].visible = true
	#	holder[3].visible = false
	#else: # se a quantidade de players for 4
		#holder[0].visible = true#
		#holder[1].visible = true
		#holder[2].visible = true
		#holder[3].visible = true

#holder[0].get_node(holderUsers.jogador1).text = nome_players[0]
#$holderUsers.jogador2 = nome_players[1]
#$holderUsers.jogador3 = nome_players[2]
#$holderUsers.jogador4 = nome_players[3]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


