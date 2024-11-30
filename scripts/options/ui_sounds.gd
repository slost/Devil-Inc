extends Node

@export var root_path : NodePath

@onready var sounds = {
	&"onclick" : AudioStreamPlayer.new()
}

func _ready() -> void:
	assert(root_path != null, "Empty root path for ui sounds")
	
	for i in sounds.keys():
		sounds[i].stream = load("res://assets/audio/ui/" + str(i) + ".wav")
		sounds[i].bus = &"UI"
		add_child(sounds[i])
	
	install_sounds(get_node(root_path))

func install_sounds(node: Node) -> void:
	for child in node.get_children():
		if child is Button:
			child.pressed.connect(func(): ui_sfx_play(&"onclick"))
		elif child is TabBar:
			child.tab_clicked.connect(func(): ui_sfx_play(&"onclick"))
			
		install_sounds(child)

func ui_sfx_play(sound: StringName) -> void:
	sounds[sound].play()
