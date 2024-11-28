# Autoload: ProcGen

extends Node

var rng: RandomNumberGenerator = RandomNumberGenerator.new()

func _ready() -> void:
	rng.seed = Global.seed_string.hash()

func generate_name() -> String:
	var syllables = ["ka", "ri", "to", "ma", "su", "ne", "ko", "ta", "shi", "ru"]
	var name_length = rng.randi_range(2, 4)
	var generated_name = ""
	
	for i in range(name_length):
		generated_name += syllables[rng.randi() % syllables.size()]
	
	generated_name = generated_name.capitalize()

	return generated_name

func generate_item_name() -> String:
	var adjectives = ["Fire", "Water", "Earth", "Air"]
	var nouns = ["Sword", "Shield", "Axe", "Bow"]
	var generated_item_name = adjectives[rng.randi() % adjectives.size()] + " " + nouns[rng.randi() % nouns.size()]
	return generated_item_name
