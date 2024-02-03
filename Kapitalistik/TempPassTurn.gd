extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("TextEdit").text = "Turno: " + str(Controlador.playerTurn) + ", Fase: " + str(Controlador.fase)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	Controlador.proximaFase()
	get_node("TextEdit").text = "Turno: " + str(Controlador.playerTurn) + ", Fase: " + str(Controlador.fase) 
	pass # Replace with function body.
