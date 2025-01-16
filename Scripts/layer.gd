extends TextureButton

class_name Layer

@export
var enable : int

@export
var numero : int

@export
var bpm : int

@export
var instrument : String

@export
var note : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Nouvelle layer créée")

func setup(enable_ : bool, num_ : int, bpm_ : int, instru_ : String, note_ : int) -> void:
	numero = num_
	bpm = bpm_
	instrument = instru_
	note = note_
	pass

func _on_pressed() -> void:
	print_rich("[wave]Layer pressed[/wave]")
	GAME.current_layer = GAME.current_level.layers[numero]
	
