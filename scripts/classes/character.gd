extends RigidBody3D
class_name Character

@export var NAME: String

@export var stats: BaseStats

@export var level: int = 1

@export var max_hp: float = 0.0
@export var max_hp_multiplier: float = 1.0
@export var speed_multiplier: float = 1.0

var hp: float = 0.0

func _ready() -> void:
	max_hp = Util.get_max_hp(stats.base_max_hp, max_hp_multiplier)
	hp = max_hp

func get_stat(stat: String) -> float:
	if stats:
		return stats.get("stat")
	return 0.0
