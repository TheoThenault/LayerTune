extends Button


## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass


func _on_pressed() -> void:
	print("Charger \"LevelPlay\" avec le bon niveau.")
	GAME.LevelStart.hide()
	GAME.LevelPlay.show()
	GAME.current_layer = GAME.current_level.layers[0]
	AUDIO.play_level = false
	AUDIO.play_layer = true
	AUDIO.silence()
