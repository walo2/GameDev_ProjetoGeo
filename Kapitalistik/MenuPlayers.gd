extends Control

@export var num_players_selected = 2
@onready var labels = [$Player1_name, $Player2_name, $Player3_name, $Player4_name]

# Called when the node enters the scene tree for the first time.
func _ready():
	
	labels[0].visible = false
	labels[1].visible = false
	labels[2].visible = false
	labels[3].visible = false
	$Enter.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_2players_pressed():
	num_players_selected = 2
	GlobalData.set_num_players(num_players_selected)
	labels[0].visible = true
	labels[1].visible = true
	$Enter.visible = true
	

func _on_3players_pressed():
	num_players_selected = 3
	GlobalData.set_num_players(num_players_selected)
	labels[0].visible = true
	labels[1].visible = true
	labels[2].visible = true
	$Enter.visible = true
	


func _on_4players_pressed():
	num_players_selected = 4
	GlobalData.set_num_players(num_players_selected)
	labels[0].visible = true
	labels[1].visible = true
	labels[2].visible = true
	labels[3].visible = true
	$Enter.visible = true
	

func get_player_name(playerID):
	playerID = InputEvent

func _on_player_1_name_text_changed(new_text):
	GlobalData.set_player_name(0, new_text);
	
func _on_player_2_name_text_changed(new_text):
	GlobalData.set_player_name(1, new_text);
	
func _on_player_3_name_text_changed(new_text):
	GlobalData.set_player_name(2, new_text);
	
func _on_player_4_name_text_changed(new_text):
	GlobalData.set_player_name(3, new_text);


func _on_enter_pressed():
	get_tree().change_scene_to_file("res://tile_map.tscn")
