extends Node
class_name LootBox

# Time between item spawns
@export var spawn_time: float = 5.0
@export var time_to_spawn: float = 30.0

# Timer counter
var spawn_timer: float = 0.0
@onready var label = $Label


func _process(delta: float) -> void:

	label.text = "Next drop: " + str(time_to_spawn - spawn_timer)


	spawn_timer += delta
	if spawn_timer >= time_to_spawn:
		spawn_timer = 0
		Util.generate_item()
		print("Item spawned")
		
