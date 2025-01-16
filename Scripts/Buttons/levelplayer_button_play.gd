extends TextureButton

func _on_pressed() -> void:
	print("Jouer la musique écrite par le joueur")
	AUDIO.play_level = !AUDIO.play_level
	AUDIO.play_player_level = true
