extends TextureButton

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

func setup(num_ : int, bpm_ : int, instru_ : String, note_ : int) -> void:
	numero = num_
	bpm = bpm_
	instrument = instru_
	note = note_
	pass

func _on_pressed() -> void:
	print_rich("[wave]Layer pressed[/wave]")

	if(GAME.current_layer):
		if(GAME.current_layer.disabled):
			GAME.current_layer.texture_normal = GAME.disabled_image
		else:
			GAME.current_layer.texture_normal = GAME.norm_image

	GAME.current_layer = self

	if(disabled):
		GAME.current_layer.texture_normal = GAME.focus_disabled_image
	else:
		GAME.current_layer.texture_normal = GAME.focus_image
