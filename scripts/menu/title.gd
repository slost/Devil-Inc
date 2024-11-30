class_name MainMenu
extends Control

@onready var start_game = preload("res://scenes/game.tscn") as PackedScene
@onready var margin_container = $MarginContainer as MarginContainer
@onready var options_menu = $Options as OptionsMenu
@onready var game_logo = $Logo as Sprite2D

func _ready() -> void:
	handle_connecting_signal()

func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(start_game)

func _on_tutorial_pressed() -> void:
	pass # Replace with function body.

func _on_options_pressed() -> void:
	options_menu.set_process(true)
	margin_container.visible = false
	game_logo.visible = false
	options_menu.visible = true

func _on_exit_options_menu() -> void:
	margin_container.visible = true
	game_logo.visible = true
	options_menu.visible = false

func _on_quit_pressed() -> void:
	get_tree().quit()

func handle_connecting_signal() -> void:
	options_menu.exit_options_menu.connect(_on_exit_options_menu)
