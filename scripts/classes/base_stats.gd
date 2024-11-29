extends Resource
class_name BaseStats

@export_category("Base")
@export var base_max_hp: float = 0.0
@export var base_hp_regen: float = 0.0

@export_category("Attacking")
@export var base_attack_damage: float = 0.0
@export var base_attack_speed: float = 0.0
@export var base_critical_chance: float = 0.0
@export var base_critical_damage: float = 0.0
@export var base_attack_range: float = 0.0
@export var base_attack_cooldown: float = 0.0

var health: float = 0.0
