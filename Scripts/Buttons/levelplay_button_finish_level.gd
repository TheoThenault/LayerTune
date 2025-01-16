extends Button


## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(GAME.confirmed_layer and GAME.current_level):
		if(GAME.confirmed_layer == GAME.current_level.number_of_layer()):
			self.disabled = false


func _on_pressed() -> void:
	print("Level finished go to \"LevelEnd\"")

	GAME.verify_level()

	GAME.LevelPlay.hide()
	GAME.LevelEnd.show()
