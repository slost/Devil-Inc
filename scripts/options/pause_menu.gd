extends Control

@onready var pasue_button = $Button_pause as Button

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

func _on_resume_pressed() -> void:
	resume()


func _on_options_pressed() -> void:
	Options.set_showing(true)


func _on_quit_pressed() -> void:
	pass # Replace with function body.

func _process(delta):
	testEsc()
