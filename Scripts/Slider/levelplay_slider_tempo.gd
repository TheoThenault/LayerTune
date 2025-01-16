extends HSlider

func _ready() -> void:
	_on_value_changed(value)
	
func _on_value_changed(value_: float) -> void:
	GAME.current_bpm[GAME.current_layer.numero] = value
	
	var labelBPM : Label = get_node("../LabelBPM")
	labelBPM.text = "%d" % (value_)
