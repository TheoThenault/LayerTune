extends Button


## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(GAME.confirmed_layer and GAME.current_level):
		if(GAME.confirmed_layer == GAME.current_level.number_of_layer()):
			self.disabled = true

func _on_pressed() -> void:
	print("Disable the layer, prevent player from modifying")
	
	if(!disabled and GAME.current_layer):
		GAME.current_layer.disabled = true
		GAME.current_layer.note = GAME.SliderNote.value
		GAME.current_layer.bpm  = GAME.SliderTempo.value
		GAME.confirmed_layer += 1
		
		if(GAME.current_layer.numero+1 < GAME.current_level.layers.size()):
			if(GAME.current_layer):
					GAME.current_layer.texture_normal = GAME.disabled_image
			GAME.current_layer = GAME.current_level.layers[GAME.current_layer.numero+1]
			if(GAME.current_layer):
				GAME.current_layer.texture_normal = GAME.focus_image
		
		
		
