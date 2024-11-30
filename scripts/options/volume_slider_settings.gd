extends Control

@onready var audio_type = $HBoxContainer/audio_type as Label
@onready var audio_level = $HBoxContainer/audio_level as Label
@onready var audio_slider = $HBoxContainer/HSlider as HSlider

@export_enum("Master", "Music", "SFX", "UI") var bus_name : String

var bus_index : int = 0

func _ready() -> void:
	audio_slider.value_changed.connect(on_value_change)
	get_bus_by_index()
	set_audio_type_label()
	set_slider_value()

func set_audio_type_label() -> void:
	audio_type.text = str(bus_name) + " Volume"

func set_audio_level_label() -> void:
	audio_level.text = str(audio_slider.value * 100) + " %"
	
func get_bus_by_index() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	
func set_slider_value() -> void:
	audio_slider.value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))
	set_audio_level_label()

func on_value_change(value: float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	set_audio_level_label()
