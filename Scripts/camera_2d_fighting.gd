extends Camera2D

var zoom_speed = 0.1
var min_zoom = 0.5
var max_zoom = 2.0

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom_camera(zoom_speed)
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom_camera(-zoom_speed)

func zoom_camera(amount):
	# Increase zoom value to zoom in, decrease to zoom out
	zoom.x = clamp(zoom.x + amount, min_zoom, max_zoom)
	zoom.y = clamp(zoom.y + amount, min_zoom, max_zoom)
