extends Node

@export var sfx_player: AudioStreamPlayer2D
@export var bgm_player: AudioStreamPlayer2D


enum SFX {
	OPENING_CHEST,
	CLICK,
}

enum UI {
	CLICK,
	HOVER,
	ACTIVATE,
	CANCLED,


}

func play_sound(sound: int) -> void:
	print(sfx_player)
	match sound:
		SFX.OPENING_CHEST:
			sfx_player.stream = preload("res://assets/audio/sfx/opening_chest.wav")
		_:
			sfx_player.stream = preload("res://assets/audio/ui/onclick.wav")
	sfx_player.play()

func play_music(track: int) -> void:
	match track:
		1:
			bgm_player.stream = preload("res://assets/audio/bgm/track_1.ogg")
		_:
			bgm_player.stream = preload("res://assets/audio/bgm/track_1.ogg")
	bgm_player.play()

func play_ui(sound: int) -> void:
	match sound:
		UI.CLICK:
			sfx_player.stream = preload("res://assets/audio/ui/onclick.wav")
		UI.CANCLED:
			sfx_player.stream = preload("res://assets/audio/ui/ui_cancled.ogg")
		_:
			sfx_player.stream = preload("res://assets/audio/ui/onclick.wav")
	sfx_player.play()