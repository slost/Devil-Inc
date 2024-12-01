extends Control

# References to UI elements
@onready var audio_type = $HBoxContainer/audio_type as Label
@onready var audio_level = $HBoxContainer/audio_level as Label
@onready var audio_slider = $HBoxContainer/HSlider as HSlider

# Enum for selecting audio bus type
@export_enum("Master", "Music", "SFX", "UI") var bus_name : String

# Index of the audio bus
var bus_index : int = 0

func _ready() -> void:
	# Connect slider value change signal
	audio_slider.value_changed.connect(on_value_change)
	get_bus_by_index()
	set_audio_type_label()
	set_slider_value()

	# Set Master volume to 50%
	if bus_name == "Master":
		audio_slider.value = 0.25
		on_value_change(0.25)

# Sets the label text for audio type
func set_audio_type_label() -> void:
	audio_type.text = str(bus_name) + " Volume"

# Updates the volume percentage label
func set_audio_level_label(value: float) -> void:
	audio_level.text = str(snappedf(value * 100, 0.01)) + " %"
	
# Gets the bus index from AudioServer
func get_bus_by_index() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	
# Initialize slider value from current bus volume
func set_slider_value() -> void:
	audio_slider.value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))
	set_audio_level_label(audio_slider.value)

# Handle slider value changes
func on_value_change(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	set_audio_level_label(value)
