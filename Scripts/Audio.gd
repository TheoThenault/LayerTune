extends Node

var play_layer: bool
var play_level: bool
var lastTimePlayed: Array[float]

func playNote() -> void:
	if (Time.get_unix_time_from_system() - lastTimePlayed[GAME.current_layer.numero] >= 60/GAME.current_bpm[GAME.current_layer.numero]):
		GAME.current_note_stream[GAME.current_layer.numero].play()
		lastTimePlayed[GAME.current_layer.numero] = Time.get_unix_time_from_system()
	
func playAll() -> void:
	for note in range(0, GAME.current_note_stream.size()):
		if (Time.get_unix_time_from_system() - lastTimePlayed[note] >= 60/GAME.current_bpm[note]):
			GAME.current_note_stream[note].play()
			lastTimePlayed[note] = Time.get_unix_time_from_system()

func _ready() -> void:
	for note in range(0, 6):
		lastTimePlayed.append(Time.get_unix_time_from_system())

func _process(delta: float) -> void:
	if (play_layer):
		AUDIO.playNote()
	if (play_level):
		AUDIO.playAll()
		
	
