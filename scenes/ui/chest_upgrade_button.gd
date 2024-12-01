extends Control

@export var upgrade_click: Button
@export var upgrade_name: String

func _ready() -> void:
	upgrade_click.pressed.connect(on_upgrade_click)
	$HBoxContainer/upgrade_type.text = upgrade_name

func on_upgrade_click() -> void:
	print("Upgrade clicked")
