extends TextureRect

var dragging = false
var drag_offset = Vector2()
var draggable = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Enable input processing
	set_process_input(true)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed and get_rect().has_point(event.position):
				dragging = true
				drag_offset = get_global_mouse_position() - position
			else:
				dragging = false
	elif event is InputEventMouseMotion and dragging:
		var new_position = get_global_mouse_position() - drag_offset
		var screen_size = get_viewport_rect().size
		new_position.x = clamp(new_position.x, 0, screen_size.x - size.x)
		new_position.y = clamp(new_position.y, 0, screen_size.y - size.y)
		position = new_position
		get_parent()._process(0)  # Update the wire position
