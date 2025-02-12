extends Control

signal click

@export var INDEX:int
@export var SPEED:float = 1.0

const BLANK = preload("res://Mini-Games/keypad/tmpTextures/blank.png")

@onready var texture_rect: TextureRect = $TextureRect

var defaultxt__tecolor

func _ready():
	$Label.text = str(INDEX)
	default_text_color = $Label.font_color

func _on_gui_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		click.emit(self)
