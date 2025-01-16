extends HSlider

func _ready() -> void:
	pass

func _on_value_changed(value: float) -> void:
	
	var labelNOTE : Label = get_node("../LabelNOTE")
	labelNOTE.text = "%d" % value
	
	if (value > 23):
		GAME.pitchshifts[GAME.current_layer.numero].pitch_scale = pow(2, (value-29)/12.0)
		GAME.current_note_stream[GAME.current_layer.numero] = get_node("../../Sounds/"+GAME.current_layer.instrument+"/Fa4")
	elif (value > 11):
		GAME.pitchshifts[GAME.current_layer.numero].pitch_scale = pow(2, (value-17)/12.0)
		GAME.current_note_stream[GAME.current_layer.numero] = get_node("../../Sounds/"+GAME.current_layer.instrument+"/Fa3")
	else:
		GAME.pitchshifts[GAME.current_layer.numero].pitch_scale = pow(2, (value-5)/12.0)
		GAME.current_note_stream[GAME.current_layer.numero] = get_node("../../Sounds/"+GAME.current_layer.instrument+"/Fa2")
