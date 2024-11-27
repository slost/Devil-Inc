extends Node
class_name Item

# Item name 
@export var NAME: String = "item_name"
# Item description
@export var description: String = "A describtion."

@export_category("Stats")
# Stats
@export var stats: Stats
# Projectile stats
@export var projectile_stats: ProjectileStats
# Elemental stats   
@export var elementals: Array[Elemental] = []


# Generate data for the item
func generate_data():
	# TODO: Mr. Earthz
    pass
