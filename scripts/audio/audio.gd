extends Node

@export var sfx_player: AudioStreamPlayer2D


enum SFX {
	OPENING_CHEST,
	CLICK,
}


func play_sound(sound: int) -> void:
	print(sfx_player)
	match sound:
		SFX.OPENING_CHEST:
			sfx_player.stream = preload("res://assets/audio/sfx/opening_chest.wav")
		_:
			sfx_player.stream = preload("res://assets/audio/ui/onclick.wav")
	sfx_player.play()
