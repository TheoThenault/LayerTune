extends Button

@export
var num_level : int

func _on_pressed() -> void:
	print("Aller au niveau %d" % num_level)
	GAME.load_level(num_level)
