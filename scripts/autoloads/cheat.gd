extends Node

var konami_code = [
	KEY_UP, KEY_UP,
	KEY_DOWN, KEY_DOWN,
	KEY_LEFT, KEY_RIGHT,
	KEY_LEFT, KEY_RIGHT,
	KEY_B, KEY_A
]
var current_sequence = []

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		current_sequence.append(event.keycode)
		
		# Keep sequence same length as konami code
		if current_sequence.size() > konami_code.size():
			current_sequence.pop_front()
			
		# Check if sequences match
		if current_sequence == konami_code:
			_activate_god_mode()
			current_sequence.clear()

func _activate_god_mode() -> void:
	# Find all characters and buff their stats
	print_debug("God Mode actiavted") 
	Audio.play_ui(Audio.UI.CANCLED)
	Global.god_mode = true
    

	# var characters = get_tree().get_nodes_in_group("characters")
	# for character in characters:
	# 	if character is Character:
	# 		character.max_hp_multiplier = 999.0
	# 		character.speed_multiplier = 5.0
	# 		character.hp = character.max_hp
