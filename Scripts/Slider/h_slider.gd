extends HSlider

@export
var bus_name: String

var bus_index: int
var pitchshift: AudioEffectPitchShift
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	pitchshift = AudioEffectPitchShift.new()
	AudioServer.add_bus_effect(bus_index, pitchshift)
	#get_node("../"+bus_name+"/Do2").play()
	pitchshift.pitch_scale = pow(2, (value-5)/12.0)
	GAME.current_note_stream = get_node("../../Sounds/"+bus_name+"/Fa2")

func _on_value_changed(value: float) -> void:
	
	var labelNOTE : Label = get_node("../LabelNOTE")
	labelNOTE.text = "%d" % (value + 1)
	
	'''get_node("../../Sounds/"+bus_name+"/Do2").stop()
	get_node("../../Sounds/"+bus_name+"/Do3").stop()
	get_node("../../Sounds/"+bus_name+"/Do4").stop()'''
	get_node("../../Sounds/"+bus_name+"/Fa2").stop()
	get_node("../../Sounds/"+bus_name+"/Fa3").stop()
	get_node("../../Sounds/"+bus_name+"/Fa4").stop()
	
	'''if (value > 29):
		pitchshift.pitch_scale = pow(2, (value-29)/12.0)
		get_node("../"+bus_name+"/Fa4").play()
	elif (value > 24):
		pitchshift.pitch_scale = pow(2, (value-24)/12.0)
		get_node("../"+bus_name+"/Do4").play()
	elif (value > 17):
		pitchshift.pitch_scale = pow(2, (value-17)/12.0)
		get_node("../"+bus_name+"/Fa3").play()
	elif (value > 12):
		pitchshift.pitch_scale = pow(2, (value-12)/12.0)
		get_node("../"+bus_name+"/Do3").play()
	elif (value > 5):
		pitchshift.pitch_scale = pow(2, (value-5)/12.0)
		get_node("../"+bus_name+"/Fa2").play()
	else:
		pitchshift.pitch_scale = pow(2, (-5+value)/12.0)
		get_node("../"+bus_name+"/Do2").play()'''
	
	if (value > 23):
		pitchshift.pitch_scale = pow(2, (value-29)/12.0)
		GAME.current_note_stream = get_node("../../Sounds/"+bus_name+"/Fa4")
	elif (value > 11):
		pitchshift.pitch_scale = pow(2, (value-17)/12.0)
		GAME.current_note_stream = get_node("../../Sounds/"+bus_name+"/Fa3")
	else:
		pitchshift.pitch_scale = pow(2, (value-5)/12.0)
		GAME.current_note_stream = get_node("../../Sounds/"+bus_name+"/Fa2")
