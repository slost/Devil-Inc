extends Node

var position_target: Vector3

@export var speed: float = 1.0

func _physics_process(delta: float) -> void:
    var cursor_position = Util.get_cursur_position()
    print("Cursor position: " + str(cursor_position))
    print(Global.cursor)
    print("Player position: " + str(Global.player.position))

    if Global.player:
        var player = Global.player
        var direction = Util.get_cursur_position() - player.global_transform.origin
        direction.y = 0 # Prevent vertical movement if not required
        direction = direction.normalized()
        player.velocity.x = direction.x * current_speed()
        player.velocity.z = direction.z * current_speed()
        player.move_and_slide()

func current_speed() -> float:
    var base_speed = 1
    var multi_speed = 1
    return speed * base_speed * multi_speed