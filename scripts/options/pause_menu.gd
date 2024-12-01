class_name PauseMenu
extends Control

@export var options_menu: OptionsMenu
@onready var pause_panel = $PanelContainer as PanelContainer

func _ready() -> void:
	_connecting_signal()

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")

func testEsc():
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		resume()


func _on_resume_pressed():
	resume()


func _on_quit_pressed():
	get_tree().quit()

func _process(delta):
	testEsc()

func _on_options_pressed() -> void:
	options_menu.set_process(true)
	pause_panel.visible = false
	options_menu.visible = true
	
func _on_exit_options_menu() -> void:
	pause_panel.visible = true
	options_menu.visible = false

func _connecting_signal() -> void:
	if options_menu != null:
		options_menu.exit_options_menu.connect(_on_exit_options_menu)
