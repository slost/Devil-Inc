extends CharacterBody3D

@onready var cursor = $Cursor

func _ready() -> void:
    # Set global variables
    Global.player = self
    Global.camera = $Camera3D

