extends HSlider

func _ready() -> void:
	pass

func _on_value_changed(value: float) -> void:
	
	var labelNOTE : Label = get_node("../LabelNOTE")
	labelNOTE.text = "%d" % value
	
	if (value > 23):
		GAME.current_note[GAME.current_layer.numero] = value-29
		GAME.current_note_stream[GAME.current_layer.numero] = get_node("../../Sounds/"+GAME.current_layer.instrument+"/Fa4")
	elif (value > 11):
		GAME.current_note[GAME.current_layer.numero] = value-17
		GAME.current_note_stream[GAME.current_layer.numero] = get_node("../../Sounds/"+GAME.current_layer.instrument+"/Fa3")
	else:
		GAME.current_note[GAME.current_layer.numero] = value-5
		GAME.current_note_stream[GAME.current_layer.numero] = get_node("../../Sounds/"+GAME.current_layer.instrument+"/Fa2")
