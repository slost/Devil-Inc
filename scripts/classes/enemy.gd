extends Character
class_name Enemy

var state: int = STATE.IDLE

var sprite: int

enum STATE {
	IDLE,
	CHASING,
	ATTACKING,
	DEAD
}
	
func _process(delta: float) -> void:

	if Global.crystal != null:
		state = STATE.CHASING
	_generate_data()
	
func _process(delta: float) -> void:
	match state:
		STATE.CHASING:
			_chasing_crystal()

func _chasing_crystal() -> void:
	if Global.crystal == null:
		state = STATE.IDLE
		return
		
	var direction = (Global.crystal.global_position - global_position).normalized()
	# direction.y = 0 # Keep movement on XZ plane only
	
	# Move the enemy towards the crystal
	var velocity = direction * Util.get_speed(get_stat("base_speed"), speed_multiplier) * get_process_delta_time()
	global_position += velocity

		

func _generate_data() -> void:
	_randomize_sprite()


func _randomize_stats() -> void:
	var _level = randi_range(1, 10)
	var base_stats = {
		"base_speed": randi_range(50 + _level * 5, 100 +_level * 10),
		"base_damage": randi_range(5 + _level * 2, 15 + _level * 5), 
		"base_health": randi_range(50 + _level * 10, 100 + _level * 20)
	}
	
	for stat in base_stats:
		set_stat(stat, base_stats[stat])
		print_debug("random %s: %d" % [stat, base_stats[stat]])


func _randomize_sprite() -> void:
	var max_sprites: int = 34 # VFrames
	sprite = randi_range(1, 34)
	if $Sprite3D:
		$Sprite3D.frame = sprite * 4 # 4 is Hframes
		print_debug("random sprite: " + str(sprite))

func _handle_death() -> void:
	Global.junks += randi_range(0, 100)
	queue_free()
