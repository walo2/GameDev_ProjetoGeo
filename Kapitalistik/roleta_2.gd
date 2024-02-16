extends Node2D

@onready var seta = $Seta

var rodar = false
var parar = false
var sorteado = 4
var voltas = 5
var pararNumero
var velocidade = 0
var aceleracao = 0.2
var acelerar = false
var desacelerar = false
var meiaVoltas
 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rodar == true:
		seta.rotation_degrees = seta.rotation_degrees+velocidade
		
		if voltas > meiaVoltas:
			if velocidade < 30:
				velocidade = velocidade + aceleracao
		else:
			if velocidade > 2:
				velocidade = velocidade - aceleracao
		
		
		if seta.rotation_degrees >= 360:
			seta.rotation_degrees = seta.rotation_degrees - 360
			voltas = voltas - 1
		
		if voltas == 0:
			parar = true
		
		if parar == true:
			if seta.rotation_degrees > pararNumero-5 and seta.rotation_degrees < pararNumero+5:
				rodar = false
				desacelerar = false


func sortearNumero():
	if GlobalData.fase == 1:
		voltas = (1 + randi()%5)*2
		sorteado = (randi()%6) + 1
		pararNumero = (sorteado-1) * 60 
		parar = false
		rodar = true
		acelerar = true
		desacelerar = false
		meiaVoltas = int(voltas/2)
		velocidade = 0
		
		GlobalData.proximaFase()
		GlobalData.numeroRoleta(sorteado)
	return sorteado


func _on_button_pressed():
	sortearNumero()
	pass # Replace with function body.
