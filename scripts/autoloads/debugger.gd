# Autoload: Debug

extends Node

func _input(_event):
	# Press debug_restart (F5) to restart the game scene
	if Input.is_action_just_released("debug_restart"):
		get_tree().reload_current_scene()