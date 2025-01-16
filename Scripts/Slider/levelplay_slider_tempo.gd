extends HSlider

var labelBPM : Label

func _ready() -> void:
	labelBPM = get_node("../LabelBPM")
	labelBPM.text = "%d BPM" % (50)
	
func _on_value_changed(value_: float) -> void:
	GAME.current_bpm[GAME.current_layer.numero] = value
	
	labelBPM.text = "%d BPM" % (value_)
