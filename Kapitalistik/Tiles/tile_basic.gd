extends Node2D

class_name TileBasic

var playerObject = null
var mouseReleaseObject = true
var iniciou = false
var playersOnTile = []
var tileCerto = false

@onready var sorteOuReves = load("res://Imgs/sorteOuReves.png")
@onready var sprite = $Sprite2D
@onready var bdColor = $ColorRect
@onready var bdOutLineColor = $ColorRect2

@export var colorTile : Color
@export var idNumero : int

# Called when the node enters the scene tree for the first time.
func _ready():
	if idNumero == 1:
		Controlador.TileInicial = self
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
		if playerObject.posicaoAtual + Controlador.numeroSorteado != idNumero:
			playerObject.newPosition(playerObject.posicaoInicial.x, playerObject.posicaoInicial.y)
			playerObject = null
		if tileCerto == true:
			playerObject.posicaoAtual = idNumero
			playerObject.posicaoInicial = position
			playerObject = null
			Controlador.proximaFase()
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
	
#Método que executa a ação de cada casa. Passa um objeto do tipo PlayerTemp
func action(player):
	pass

func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if Controlador.fase == 2:
		var player = area.get_parent()
		playerObject = player
		if player.posicaoAtual + Controlador.numeroSorteado == idNumero:
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
