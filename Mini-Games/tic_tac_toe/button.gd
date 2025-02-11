extends Control

signal click
@export var index: int

const o_texture = preload("res://Mini-Games/tic_tac_toe/tmpTextures/o.png")
const x_texture = preload("res://Mini-Games/tic_tac_toe/tmpTextures/x.png")

func _ready():
	$texture.custom_minimum_size = size

func draw_o():
	$texture.texture = o_texture
	
func draw_x():
	$texture.texture = x_texture

func _on_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			click.emit(self)
