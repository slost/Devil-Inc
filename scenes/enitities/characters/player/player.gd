extends CharacterBody3D

@export var inventory: Node


@onready var cursor = $Cursor

func _ready() -> void:
	# Set global variables
	Global.player = self
	Global.camera = $Camera3D
