extends Button


## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass


func _on_pressed() -> void:
	print("Retourner au menu et passer le niveau en validé ou pas.")
	GAME.LevelEnd.hide()
	GAME.MainMenu.show()
	
	var container : VBoxContainer = get_node("../../LevelPlay/ContainerLayers")
	for child in container.get_children():
		child.queue_free()
		#container.remove_child()
	var niveau = get_node("../../NIVEAU")
	if(niveau):
		niveau.queue_free()
	
	print("Valider le niveau si bon")
	
	GAME.clean()
