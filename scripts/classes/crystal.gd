extends Character
class_name Crystal

@export var progress_bar: ProgressBar

func _ready() -> void:
	Global.crystal = self
	hp = 100

func _process(delta: float) -> void:
	progress_bar.value = hp
	progress_bar.max_value = max_hp

	if hp <= 0:
		print_debug("Crystal destroyed")
