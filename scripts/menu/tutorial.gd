class_name TutorialPage
extends Control

@onready var back_button = $MarginContainer2/Back as Button

signal exit_tutorial_page

func _ready() -> void:
	back_button.button_down.connect(_on_back_pressed)
	set_process(false)

func _on_back_pressed() -> void:
	exit_tutorial_page.emit()
	set_process(false)
