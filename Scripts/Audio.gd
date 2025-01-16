extends Node

var play_layer: bool
var play_level: bool
var play_player_level: bool
var lastTimePlayed: Array[float]

func playNote() -> void:
	#AUDIO.silence()	
	if(GAME.current_layer):
		if (Time.get_unix_time_from_system() - lastTimePlayed[GAME.current_layer.numero] >= 60/GAME.current_bpm[GAME.current_layer.numero]):
			GAME.pitchshifts[GAME.current_layer.numero].pitch_scale = pow(2, (GAME.current_note[GAME.current_layer.numero])/12.0)
			GAME.current_note_stream[GAME.current_layer.numero].play()
			lastTimePlayed[GAME.current_layer.numero] = Time.get_unix_time_from_system()
	
func playAll() -> void:
	for note in range(0, GAME.current_note_stream.size()):
		if (Time.get_unix_time_from_system() - lastTimePlayed[note] >= 60/GAME.current_bpm[note]):
			GAME.pitchshifts[note].pitch_scale = pow(2, (GAME.current_note[note])/12.0)
			GAME.current_note_stream[note].play()
			lastTimePlayed[note] = Time.get_unix_time_from_system()

func _ready() -> void:
	for note in range(0, 6):
		lastTimePlayed.append(Time.get_unix_time_from_system())

func _process(delta: float) -> void:
	if (play_level and play_player_level):
		AUDIO.playAll()
	elif (play_level and !play_player_level):
		AUDIO.playAllRight()
	elif (play_layer):
		AUDIO.playNote()
		
func playAllRight() -> void:
	var current_bpm : Array[float]
	var current_note : Array[float]
	
	for layer in GAME.current_level.right_layers:
		current_bpm.append(layer.bpm)
		if (layer.note > 23):
			current_note.append(layer.note-29)
			GAME.current_note_stream[layer.numero] = get_node("../MainScene/Sounds/"+layer.instrument+"/Fa4")
		elif (layer.note > 11):
			current_note.append(layer.note-17)
			GAME.current_note_stream[layer.numero] = get_node("../MainScene/Sounds/"+layer.instrument+"/Fa3")
		else:
			current_note.append(layer.note-5)
			GAME.current_note_stream[layer.numero] = get_node("../MainScene/Sounds/"+layer.instrument+"/Fa2")

		
	for note in range(0, GAME.current_note_stream.size()):
		if (Time.get_unix_time_from_system() - lastTimePlayed[note] >= 60/current_bpm[note]):
			GAME.pitchshifts[note].pitch_scale = pow(2, (current_note[note])/12.0)
			GAME.current_note_stream[note].play()
			lastTimePlayed[note] = Time.get_unix_time_from_system()

func silence():
	for stream in GAME.current_note_stream:
		stream.stop()
