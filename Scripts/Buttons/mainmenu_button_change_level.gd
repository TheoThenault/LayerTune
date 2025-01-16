extends Button

@export
var num_level : int

func _on_pressed() -> void:
	print("Aller au niveau %d" % num_level)
	GAME.load_level(num_level)
	GAME.MainMenu.hide()
	GAME.LevelStart.show()
	
	GAME.current_layer = get_node("../../../LevelPlay/ContainerLayers/PlayLayer1")
	if(GAME.current_layer):
		GAME.current_layer.texture_normal = GAME.focus_image
	
