extends Character
class_name Enemy

var state: int = STATE.IDLE

enum STATE {
	IDLE,
	CHASING,
	ATTACKING,
	DEAD
}

func _ready() -> void:
	if Global.crystal != null:
		state = STATE.CHASING
	
func _process(delta: float) -> void:
	match state:
		STATE.CHASING:
			chasing_crystal()

func chasing_crystal() -> void:
	if Global.crystal == null:
		state = STATE.IDLE
		return
		
	var direction = (Global.crystal.global_position - global_position).normalized()
	global_position += direction * Util.get_speed(get_stat("base_speed"), speed_multiplier) * get_process_delta_time()
		
