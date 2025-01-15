extends HSlider

var lastTimePlayed: float
var intervalle: float

func _ready() -> void:
	lastTimePlayed = Time.get_unix_time_from_system()
	intervalle = value/60

func _process(delta: float) -> void:
	if (Time.get_unix_time_from_system()-lastTimePlayed >= intervalle):
		get_node("../SliderNote").play()
		lastTimePlayed = Time.get_unix_time_from_system()
	
func _on_value_changed(value_: float) -> void:
	intervalle = 60/value
	
	var labelBPM : Label = get_node("../LabelBPM")
	labelBPM.text = "%d" % (value_)
