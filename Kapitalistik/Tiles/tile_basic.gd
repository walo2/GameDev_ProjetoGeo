extends Node2D

var playerObject = null
var mouseReleaseObject = true
var iniciou = false
var playersOnTile = []
var tileCerto = false
var tileAlvo = 0

@onready var sorteOuReves = load("res://Imgs/sorteOuReves.png")
@onready var sprite = $Sprite2D
@onready var bdColor = $ColorRect
@onready var bdOutLineColor = $ColorRect2


@export var colorTile : Color
@export var idNumero : int

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Label").text = str(idNumero)
	if idNumero == 1:
		GlobalData.TileInicial = self
	bdColor.color = colorTile
	if idNumero == 3 or idNumero == 8 or idNumero == 12:
		sprite.texture = sorteOuReves
		bdColor.visible = false
		bdOutLineColor.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	playersPosition()
	if mouseReleaseObject == true and playerObject != null:
		if tileAlvo != idNumero:
			playerObject.newPosition(playerObject.posicaoInicial.x, playerObject.posicaoInicial.y)
			playerObject = null
		if tileCerto == true:
			playerObject.posicaoAtual = idNumero
			playerObject.posicaoInicial = position
			#Ações:
			if(idNumero == 1):
				Action.t1_inicio()
			elif(idNumero == 2):
				Action.t2_forca_de_trabalho(playerObject.playerId)
			elif(idNumero == 3 || idNumero == 8 || idNumero == 12):
				Action.t_sorte_ou_reves(playerObject.playerId, GlobalData.numeroSorteado)
			elif(idNumero == 4):
				Action.t4_comprar_casa(playerObject.playerId)
			elif(idNumero == 5):
				Action.t5_perguntas(playerObject.playerId)
			elif(idNumero == 6):
				Action.t6_formacao(playerObject.playerId)
			elif(idNumero == 7):
				Action.t7_feira(playerObject.playerId)
			elif(idNumero == 9):
				Action.t9_agricultura(playerObject.playerId)
			elif(idNumero == 10):
				Action.t10_plano_de_saude(playerObject.playerId)
			elif(idNumero == 11):
				Action.t11_grandes_fortunas(playerObject.playerId)
			elif(idNumero == 13):
				Action.t11_grandes_fortunas(playerObject.playerId)
			elif(idNumero == 14):
				Action.t14_recuperacao_ambiental(playerObject.playerId)
			elif(idNumero == 15):
				Action.t15_ferias(playerObject.playerId)
			playerObject = null		
			GlobalData.proximaFase()
			tileCerto = false
	pass

#função que coloca o player nas posições dentro dos tiles
func playersPosition():
	var i = 0
	var total = playersOnTile.size()
	var deslocamento = 20 
	var newPosiX
	var newPosiY
	while i < total:
		if total < 3:
			if((total-1) %2 == 0):
				newPosiX = position.x + (deslocamento * (i- (total-1)/2))
				newPosiY = position.y
			else:
				newPosiX = (position.x - deslocamento/2) + (deslocamento * (i- (total-1)/2))
				newPosiY = position.y
		else:
			if i < 2: 
				newPosiX = (position.x - deslocamento/2) + (deslocamento * i)
				newPosiY = position.y - deslocamento/2
			else: 
				if((total - 2 - 1) %2 == 0):
					newPosiX = position.x + (deslocamento * (i - 2 - (total - 2-1)/2))
					newPosiY = position.y + deslocamento/2
				else:
					newPosiX = (position.x - deslocamento/2) + (deslocamento * (i - 2 - (total - 2-1)/2))
					newPosiY = position.y + deslocamento/2
		playersOnTile[i].newPosition(newPosiX,newPosiY)
		i += 1

func inicioJogo(playerObIni):
	playersOnTile.append(playerObIni)
	playersPosition()

func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if GlobalData.fase == 2:
		var player = area.get_parent()
		playerObject = player
		
		if player.posicaoAtual == 15:
			tileAlvo = 1
		elif player.posicaoAtual + GlobalData.numeroSorteado < 1:
			tileAlvo = 1
		elif player.posicaoAtual + GlobalData.numeroSorteado > 15:
			tileAlvo = 15
		else:
			tileAlvo = player.posicaoAtual + GlobalData.numeroSorteado
		
		if tileAlvo == idNumero:
			playersOnTile.append(player)
			tileCerto = true
		elif player.posicaoAtual == idNumero:
			playersOnTile.append(player)
		playersPosition()
	pass # Replace with function body.


func _on_area_2d_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	playerObject = null
	tileCerto = false
	if area.get_parent() in playersOnTile:
		playersOnTile.erase(area.get_parent())
	playersPosition()
	pass # Replace with function body.


func _input( event ):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed == false:
				mouseReleaseObject = true
				playersPosition()
			else:
				mouseReleaseObject = false
				playersPosition()
