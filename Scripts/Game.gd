extends Node

var current_level

var current_layer : int

var MainMenu : Control
var LevelStart : Control
var LevelPlay : Control
var LevelEnd : Control

func setup() -> void:
	MainMenu = get_node("/root/MainScene/MainMenu")
	LevelStart = get_node("/root/MainScene/LevelStart")
	LevelPlay = get_node("/root/MainScene/LevelPlay")
	LevelEnd = get_node("/root/MainScene/LevelEnd")

func verify_layer() -> void:
	print("Vérification de la layer %d" % current_layer)

func verify_level() -> Array[bool]:
	print("Vérification du niveau %d" % current_level)
	return [true, false]

func load_level(numero : int) -> void:	
	print("Chargement du niveau %d" % numero)
	
	if(is_instance_valid(current_level)):
		current_level.queue_free()
	current_level = null
	
	var niveau_path : String = "res://Levels/niveau%d.tscn" % numero
	var niveau_res : PackedScene = load(niveau_path)
	if(niveau_res):
		current_level = niveau_res.instantiate()
		current_level.name = "NIVEAU"
		get_node("/root/MainScene").add_child(current_level)
	
	
	
	
