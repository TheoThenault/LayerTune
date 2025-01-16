extends Node

@export_category("Layer1")
@export var enable1 : bool = false
@export_enum("Drum", "Piano", "Flute", "Banjo", "Harmonica", "Whistle") var instrument1 : String
@export_range(1, 36) var note1 : int
@export_range(50, 200, 5) var bpm1 : int

@export_category("Layer2")
@export var enable2 : bool = false
@export var instrument2 : String
@export var note2 : int
@export_range(50, 200, 5) var bpm2 : int

@export_category("Layer3")
@export var enable3 : bool = false
@export var instrument3 : String
@export var note3 : int
@export_range(50, 200, 5) var bpm3 : int

@export_category("Layer4")
@export var enable4 : bool = false
@export var instrument4 : String
@export var note4 : int
@export_range(50, 200, 5) var bpm4 : int

@export_category("Layer5")
@export var enable5 : bool = false
@export var instrument5 : String
@export var note5 : int
@export_range(50, 200, 5) var bpm5 : int

@export_category("Layer6")
@export var enable6 : bool = false
@export var instrument6 : String
@export var note6 : int
@export_range(50, 200, 5) var bpm6 : int

func _ready() -> void:
	var container : VBoxContainer = get_node("../LevelPlay/ContainerLayers")
	
	var layer_res : PackedScene = load("res://Scenes/layer.tscn")
	if(!layer_res):
		print_rich("[wave][color=Red]load(\"res://Scenes/layer.tscn\") a pas marché[/color][/wave]")
	else:
		if(enable1):
			var layer1 = layer_res.instantiate()
			layer1.numero = 1
			layer1.instrument = instrument1
			layer1.bpm = bpm1
			layer1.note = note1
			layer1.name = "PlayLayer1"
			container.add_child(layer1)
		if(enable2):
			var layer2 = layer_res.instantiate()
			layer2.numero = 2
			layer2.instrument = instrument2
			layer2.bpm = bpm2
			layer2.note = note2
			layer2.name = "PlayLayer2"
			container.add_child(layer2)
		if(enable3):
			var layer3 = layer_res.instantiate()
			layer3.numero = 3
			layer3.instrument = instrument3
			layer3.bpm = bpm3
			layer3.note = note3
			layer3.name = "PlayLayer3"
			container.add_child(layer3)
		if(enable4):
			var layer4 = layer_res.instantiate()
			layer4.numero = 4
			layer4.instrument = instrument4
			layer4.bpm = bpm4
			layer4.note = note4
			layer4.name = "PlayLayer4"
			container.add_child(layer4)
		if(enable5):
			var layer5 = layer_res.instantiate()
			layer5.numero = 5
			layer5.instrument = instrument5
			layer5.bpm = bpm5
			layer5.note = note5
			layer5.name = "PlayLayer5"
			container.add_child(layer5)
		if(enable6):
			var layer6 = layer_res.instantiate()
			layer6.numero = 6
			layer6.instrument = instrument6
			layer6.bpm = bpm6
			layer6.note = note6
			layer6.name = "PlayLayer6"
			container.add_child(layer6)
			
	
		
