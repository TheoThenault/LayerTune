extends Node

var current_level : Node
var current_layer : Layer
var current_level_number : int
var current_note_stream : Array[AudioStreamPlayer]
var current_bpm : Array[float]
var current_note: Array[float]
var pitchshifts: Array[AudioEffectPitchShift]


var MainMenu : Control
var LevelStart : Control
var LevelPlay : Control
var LevelEnd : Control

var SliderNote : HSlider
var SliderTempo : HSlider

var ConfirmLayer : Button
var FinishLevel : Button

var norm_image = load("res://Image/SoundWave.png")
var focus_image = load("res://Image/SoundWaveCurrent.png")
var focus_disabled_image = load("res://Image/SoundWaveCurrentDisabled.png")
var disabled_image = load("res://Image/SoundWaveValid.png")

var layer_good = load("res://Image/SoundWaveGood.png")
var layer_bad = load("res://Image/SoundWaveBad.png")

var confirmed_layer : int = 0

func setup() -> void:
	MainMenu = get_node("/root/MainScene/MainMenu")
	LevelStart = get_node("/root/MainScene/LevelStart")
	LevelPlay = get_node("/root/MainScene/LevelPlay")
	LevelEnd = get_node("/root/MainScene/LevelEnd")
	
	SliderNote = get_node("/root/MainScene/LevelPlay/SliderNote")
	SliderTempo = get_node("/root/MainScene/LevelPlay/SliderTempo")
	ConfirmLayer = get_node("/root/MainScene/LevelPlay/ButtonConfirmLayer")
	FinishLevel = get_node("/root/MainScene/LevelPlay/ButtonFinishLevel")

func verify_level() -> void:
	print("Vérification du niveau %d" % current_level_number)	
		
	var res : Array[bool] = []
	
	var container = get_node("/root/MainScene/LevelPlay/ContainerLayers")
	for layer in container.get_children():
		print("size: %d" % res.size())
		print("%d | %d | %d" % [layer.numero, layer.note, layer.bpm] )
		print("%d | %d" % [current_level.note1, current_level.bpm1])
		print("%d | %d" % [current_level.note2, current_level.bpm2])
		print("%d | %d" % [current_level.note3, current_level.bpm3])
		print("%d | %d" % [current_level.note4, current_level.bpm4])
		print("%d | %d" % [current_level.note5, current_level.bpm5])
		print("%d | %d" % [current_level.note6, current_level.bpm6])
		
		if(layer.numero+1 == 1):
			if(layer.note == current_level.note1 and
			   layer.bpm  == current_level.bpm1):
				res.append(true)
			else:
				res.append(false)
				
		if(layer.numero+1 == 2):
			if(layer.note == current_level.note2 and
			   layer.bpm  == current_level.bpm2):
				res.append(true)
			else:
				res.append(false)
				
		if(layer.numero+1 == 3):
			if(layer.note == current_level.note3 and
			   layer.bpm  == current_level.bpm3):
				res.append(true)
			else:
				res.append(false)
				
		if(layer.numero+1 == 4):
			if(layer.note == current_level.note4 and
			   layer.bpm  == current_level.bpm4):
				res.append(true)
			else:
				res.append(false)
				
		if(layer.numero+1 == 5):
			if(layer.note == current_level.note5 and
			   layer.bpm  == current_level.bpm5):
				res.append(true)
			else:
				res.append(false)
				
		if(layer.numero+1 == 6):
			if(layer.note == current_level.note6 and
			   layer.bpm  == current_level.bpm6):
				res.append(true)
			else:
				res.append(false)
	
	var game_won : bool = true
	for i in range(6):
		var end_layer = get_node("/root/MainScene/LevelEnd/ContainerLayers/EndLayer%d" % (i+1))
		if(end_layer and i < current_level.number_of_layer()):
			end_layer.visible = true
			if(res[i]):
				end_layer.texture = layer_good
			else:
				game_won = false
				end_layer.texture = layer_bad
		else:
			end_layer.visible = false
	
	if(game_won):
		get_node(
			"/root/MainScene/MainMenu/HBoxContainer/ButtonLevel%d" % current_level_number
		).disabled = true

func load_level(numero : int) -> void:	
	print("Chargement du niveau %d" % numero)
	
	current_level_number = numero
	
	if(is_instance_valid(current_level)):
		current_level.queue_free()
	current_level = null
	
	var niveau_path : String = "res://Levels/niveau%d.tscn" % numero
	var niveau_res : PackedScene = load(niveau_path)
	if(niveau_res):
		current_level = niveau_res.instantiate()
		current_level.name = "NIVEAU"
		get_node("/root/MainScene").add_child(current_level)

func clean() -> void:
	AUDIO.play_layer = false
	AUDIO.play_level = false
	AUDIO.play_player_level = false
	AUDIO.silence()
	
	GAME.confirmed_layer = 0
	GAME.current_layer = null
	GAME.current_level = null
	GAME.ConfirmLayer.disabled = false
	GAME.FinishLevel.disabled = true
	for pitchshift in GAME.pitchshifts:
		pitchshift.pitch_scale = 1
	GAME.pitchshifts.clear()
	GAME.current_note.clear()
	GAME.current_bpm.clear()
	GAME.current_note_stream.clear()
