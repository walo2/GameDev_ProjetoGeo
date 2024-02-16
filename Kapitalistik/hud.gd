extends CanvasLayer


@onready var holder = [$VBoxContainer/Holder, $VBoxContainer/Holder2, $VBoxContainer/Holder3, $VBoxContainer/Holder4]


# fazer algo pra settar o nome dos jogadores e atualizar os saldos

# Called when the node enters the scene tree for the first time.
func _ready():
	
	holder[0].visible = false
	holder[1].visible = false
	holder[2].visible = false
	holder[3].visible = false

	for i in GlobalData.num_players:
		holder[i].visible = true
		
	update_data()
	update_imagem()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_data()
	if GlobalData.updatePlayerImagem == true:
		update_imagem()

func update_data():
	$VBoxContainer/Holder/User.text = GlobalData.player_names[0]
	$VBoxContainer/Holder/Saldo.text = "R$ " + str(GlobalData.player_money[0])
	
	$VBoxContainer/Holder2/User.text = GlobalData.player_names[1]
	$VBoxContainer/Holder2/Saldo.text = "R$ " + str(GlobalData.player_money[1])
	
	$VBoxContainer/Holder3/User.text = GlobalData.player_names[2]
	$VBoxContainer/Holder3/Saldo.text = "R$ " + str(GlobalData.player_money[2])
	
	$VBoxContainer/Holder4/User.text = GlobalData.player_names[3]
	$VBoxContainer/Holder4/Saldo.text = "R$ " + str(GlobalData.player_money[3])

func update_imagem():
	$VBoxContainer/Holder/Icon.texture = GlobalData.playerImagens[0]
	$VBoxContainer/Holder2/Icon.texture = GlobalData.playerImagens[1]
	$VBoxContainer/Holder3/Icon.texture = GlobalData.playerImagens[2]
	$VBoxContainer/Holder4/Icon.texture = GlobalData.playerImagens[3]	
