extends Character
class_name Enemy

var state: int = STATE.IDLE

enum STATE {
	IDLE,
	CHASING,
	ATTACKING,
	DEAD
}
	
func _process(delta: float) -> void:

	if Global.crystal != null:
		state = STATE.CHASING
	else:
		state = STATE.IDLE


	match state:
		STATE.CHASING:
			chasing_crystal()

func chasing_crystal() -> void:
	if Global.crystal == null:
		state = STATE.IDLE
		return
		
	var direction = (Global.crystal.global_position - global_position).normalized()
	# direction.y = 0 # Keep movement on XZ plane only
	
	# Move the enemy towards the crystal
	var velocity = direction * Util.get_speed(get_stat("base_speed"), speed_multiplier) * get_process_delta_time()
	global_position += velocity

		
