class_name OptionsMenu
extends Control

@onready var exit_button = $MarginContainer/VBoxContainer/Back as Button

signal exit_options_menu

func _ready() -> void:
	exit_button.button_down.connect(_on_back_pressed)
	set_process(false)

func _on_back_pressed() -> void:
	exit_options_menu.emit()
	set_process(false)
