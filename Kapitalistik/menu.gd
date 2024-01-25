extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_iniciar_btn_pressed():
	get_tree().change_scene_to_file("res://tile_map.tscn")


func _on_opcoes_btn_pressed():
	pass # Replace with function body.


func _on_creditos_btn_pressed():
	pass # Replace with function body.


func _on_sair_btn_pressed():
	get_tree().quit()
