extends Node

var mouse_position: Vector2 = Vector2.ZERO
var old_mouse_position: Vector2 = Vector2.ZERO
var point_to_move_timer: float = 0.0
var focus_timer: float = 0.0
var is_moving: bool = false

@export var time_to_move: float = 15.0 # 15 frames
@export var time_to_focus: float = 15.0 # 15 frames

@export var speed: float = 1.0

func _physics_process(delta: float) -> void:
    if not Global.player:
        return

    handle_movement()

    
func handle_movement() -> void:
    var cursor_position = Util.get_cursur_position()
    Debug.cursor_position = cursor_position
    Debug.player_position = Global.player.position

    mouse_position = get_viewport().get_mouse_position()

    print(is_moving)
    print("focus_timer: ", focus_timer)

    if mouse_position != old_mouse_position:
        point_to_move_timer += 1
        if point_to_move_timer >= time_to_move:
            is_moving = true
    else:
        if is_moving:
            focus_timer += 1
            if focus_timer >= time_to_focus:
                is_moving = false
                focus_timer = 0
        else:
            # is_moving = false
            old_mouse_position = mouse_position
            point_to_move_timer = 0
            focus_timer = 0

    if is_moving:
        move_to_cursor()


    

func move_to_cursor() -> void:
    var player = Global.player
    var direction = Util.get_cursur_position() - player.global_transform.origin
    direction.y = 0  # Prevent vertical movement if not required
    if direction.length() > 0.1:  # Move only if far enough
        direction = direction.normalized()
        player.velocity.x = direction.x * current_speed()
        player.velocity.z = direction.z * current_speed()
        player.move_and_slide()
    else:
        player.velocity = Vector3.ZERO  # Stop movement if already at target
    
    old_mouse_position = mouse_position



func current_speed() -> float:
    var base_speed = 1
    var multi_speed = 1
    return speed * base_speed * multi_speed