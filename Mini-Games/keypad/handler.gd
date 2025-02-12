extends Node2D

const BUTTON = preload("res://Mini-Games/keypad/button.tscn")
@onready var grid_container: GridContainer = $GridContainer
@onready var camera_2d: Camera2D = $Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grid_container.size = Vector2(32*3, 32*4)
	print(grid_container.size)
	camera_2d.position = grid_container.position + grid_container.size / 2
	# Buttons 1-9
	for i in range(1, 10):
		var button = BUTTON.instantiate()
		button.INDEX = i
		button.click.connect(_on_Button_click)
		grid_container.add_child(button)
	# Filler non-interactable rect
	var rect = ColorRect.new()
	rect.color = Color(1, 1, 1, 0)  # Transparent color
	rect.size = Vector2(16, 16)
	grid_container.add_child(rect)
	# Button 0
	var button = BUTTON.instantiate()
	button.INDEX = 0
	button.click.connect(_on_Button_click)
	grid_container.add_child(button)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_Button_click(button):
	print(button.INDEX)
