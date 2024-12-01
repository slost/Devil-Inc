extends Node
class_name LootBox

# Time between item spawns
@export var spawn_time: float = 5.0
@export var time_to_spawn: float = 30.0
@export var progress_bar: ProgressBar
@export var anim_player: AnimationPlayer
@export var upgrade_menu: UpgradeMenu

# Timer counter
var spawn_timer: float = 0.0
@onready var label = $Label


func _process(delta: float) -> void:

	label.text = "%1.2fs" % (time_to_spawn - spawn_timer)


	spawn_timer += delta
	if spawn_timer >= time_to_spawn:
		open_chest()
		spawn_timer = 0
		Util.generate_item()
		print("Item spawned")
	elif spawn_timer > 1.5:
		reset_chest()



	update_progress_bar()

func update_progress_bar() -> void:
	progress_bar.value = spawn_timer
	progress_bar.max_value = time_to_spawn
		
func open_chest() -> void:
	Audio.play_sound(Audio.SFX.OPENING_CHEST)
	anim_player.play("opening")

func reset_chest() -> void:
	anim_player.play("RESET")

func _on_mouse_entered() -> void:
	if upgrade_menu != null:
		upgrade_menu.visible = true
	elif upgrade_menu == null:
		upgrade_menu.visible = false
