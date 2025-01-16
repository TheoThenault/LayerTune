extends HSlider

var labelNOTE : Label

var notes_names: Dictionary = {
	'1': "Do2",
	'2': "Do#2",
	'3': "Ré2",
	'4': "Ré#2",
	'5': "Mi2",
	'6': "Fa2",
	'7': "Fa#2",
	'8': "Sol2",
	'9': "Sol#2",
	'10': "La2",
	'11': "La#2",
	'12': "Si2",
	'13': "Do3",
	'14': "Do#3",
	'15': "Ré3",
	'16': "Ré#3",
	'17': "Mi3",
	'18': "Fa3",
	'19': "Fa#3",
	'20': "Sol3",
	'21': "Sol#3",
	'22': "La3",
	'23': "La#3",
	'24': "Si3",
	'25': "Do4",
	'26': "Do#4",
	'27': "Ré4",
	'28': "Ré#4",
	'29': "Mi4",
	'30': "Fa4",
	'31': "Fa#4",
	'32': "Sol4",
	'33': "Sol#4",
	'34': "La4",
	'35': "La#4",
	'36': "Si4",
}

func _ready() -> void:
	labelNOTE = get_node("../LabelNOTE")
	labelNOTE.text = notes_names[str(1)]

func _on_value_changed(value: float) -> void:
	
	labelNOTE.text = notes_names[str(value)]
	
	if (value > 23):
		GAME.current_note[GAME.current_layer.numero] = value-29
		GAME.current_note_stream[GAME.current_layer.numero] = get_node("../../Sounds/"+GAME.current_layer.instrument+"/Fa4")
	elif (value > 11):
		GAME.current_note[GAME.current_layer.numero] = value-17
		GAME.current_note_stream[GAME.current_layer.numero] = get_node("../../Sounds/"+GAME.current_layer.instrument+"/Fa3")
	else:
		GAME.current_note[GAME.current_layer.numero] = value-5
		GAME.current_note_stream[GAME.current_layer.numero] = get_node("../../Sounds/"+GAME.current_layer.instrument+"/Fa2")
