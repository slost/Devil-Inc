# Autoload: Debug

extends Node

var player_position: Vector3 = Vector3.ZERO
var cursor_position: Vector3 = Vector3.ZERO


func _input(_event):
	# Press debug_restart (F5) to restart the game scene
	if Input.is_action_just_released("debug_restart"):
		get_tree().reload_current_scene()

func get_label() -> String:
	return "Cursor position: " + str(cursor_position) + "\n" + "Player position: " \
		+ str(player_position) + "\n" + "mouse_position: " + str(get_viewport().get_mouse_position()) \
		+ "\n" + get_item_list_string()

func get_item_list_string() -> String:
	if Global.player:
		return "Item list: " + str(Global.player.inventory.get_children())
	return ""
