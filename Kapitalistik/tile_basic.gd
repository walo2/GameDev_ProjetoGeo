extends Node2D

var playerObject = null
var mouseReleaseObject = false

var playersOnTile = []

@export var colorTile : Color

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("ColorRect").color = colorTile
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#verifica quando o player é colocado no tile
	if mouseReleaseObject:
		if playerObject != null:
			playersOnTile.append(playerObject)
			mouseReleaseObject = false
			playerObject = null
		playersPosition()
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


func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	playerObject = area.get_parent()
	playersPosition()
	pass # Replace with function body.


func _on_area_2d_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	if area.get_parent() in playersOnTile:
		playersOnTile.erase(area.get_parent())
	playersPosition()
	playerObject = null
	pass # Replace with function body.


func _input( event ):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if not event.pressed:
				mouseReleaseObject = true
