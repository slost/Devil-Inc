extends Node
class_name LootBox

# Time between item spawns
@export var spawn_time: float = 5.0
@export var time_to_spawn: float = 600.0 # 10 Seconds
@export var progress_bar: ProgressBar
@export var anim_player: AnimationPlayer
@export var upgrade_menu: UpgradeMenu

# Timer counter
var spawn_timer: float = 0.0
@onready var label = $Label

func _ready() -> void:
	if upgrade_menu != null:
		upgrade_menu.visible = false

func _process(delta: float) -> void:
	if should_hide:
		hide_timer += delta
		if hide_timer >= 1.5:
			upgrade_menu.set_visible(false)
			should_hide = false
			hide_timer = 0.0

	label.text = "%1.2fs" % (time_to_spawn - spawn_timer)

	if Global.god_mode:
		time_to_spawn = 30.0

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
	upgrade_menu.set_visible(true)
var hide_timer: float = 0.0
var should_hide: bool = false

func _on_mouse_exited() -> void:
	should_hide = true
	hide_timer = 0.0


