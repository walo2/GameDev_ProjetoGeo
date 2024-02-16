extends Node2D

@onready var texto = $TextEdit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	texto.text = "Turno: " + str(GlobalData.playerTurn) + ", Fase: " + str(GlobalData.fase) 
	pass


func _on_button_pressed():
	GlobalData.proximaFase()
	pass # Replace with function body.

