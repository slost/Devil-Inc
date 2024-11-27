# Autoload: Util

extends Node


# get position of cursor in 3d scene
func get_cursur_position() -> Vector3:
	var ray_length: int = 1000
	var cursor_y = 0
	var player_position = Vector3.ZERO
	var dropPlane = Plane(Vector3(0, 1, 0), player_position.y)
	var mouse_position = get_viewport().get_mouse_position()

	var camera = Global.camera
	var from = camera.project_ray_origin(mouse_position)
	var to = from + camera.project_ray_normal(mouse_position) * ray_length
	var cursur_position = dropPlane.intersects_ray(from, to)
	var cursor = Global.cursor
	if cursor:
		cursor.transform.origin = cursur_position
		cursor.transform.origin.y = cursor_y
		return cursur_position
	return Vector3.ZERO

# Generate random item
func generate_item():
	pass