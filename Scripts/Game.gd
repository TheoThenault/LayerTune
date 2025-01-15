extends Node

var current_level : int

var current_layer : int

func verify_layer() -> void:
	print("Vérification de la layer %d" % current_layer)

func verify_level() -> Array[bool]:
	print("Vérification du niveau %d" % current_level)
	return [true, false]

func load_level(numero : int) -> void:
	print("Chargement du niveau %d" % numero)
	
	
