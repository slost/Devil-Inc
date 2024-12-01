extends Node3D

var enemy_scene: PackedScene = preload("res://scenes/enitities/characters/enemy.tscn") 
var spawn_timer: float = 0.0
var time_to_spawn: float = 600.0 # 10 Seconds

func _ready() -> void:
    Audio.play_music(1)

func _process(delta: float) -> void:
    if spawn_timer >= time_to_spawn:
        spawn_enemy()
        spawn_timer = 0.0
    else:
        spawn_timer += delta


func spawn_enemy() -> void:
    var enemy_inst = enemy_scene.instantiate()
    var spawn_point: Vector3 = Vector3(randi_range(-10, 10), 0, randi_range(-10, 10))
    enemy_inst.global_position = spawn_point
    $Entities.add_child(enemy_inst)
    
