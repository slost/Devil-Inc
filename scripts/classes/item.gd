extends Node
class_name Item

# Item name 
@export var NAME: String = "item_name"
# Item description
@export var description: String = "A describtion."

@export_category("Stats")
# Stats
@export var stats: ItemStats
# Projectile stats
@export var projectile_stats: ProjectileStats
# Elemental stats   
@export var elementals: Array[Elemental] = []

func _ready() -> void:
    generate_data()


# Generate data for the item
func generate_data() -> void:
    NAME = ProcGen.generate_item_name()
    $Label.text = NAME
	# TODO: Mr. Earthz
    pass
