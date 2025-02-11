extends Node2D

@export var num_wires = 4
@export_range(0, 1) var spawn_area_range = 0.75

@onready var play_area = $play_area
@onready var wire_template = $wire
var wire_list = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	wire_list.append(wire_template)
	while len(wire_list) < num_wires:
		var new_wire = wire_template.duplicate()
		add_child(new_wire)
		wire_list.append(new_wire)
	for i in range(len(wire_list)):
		var wire_end = wire_list[i].get_child(1)
		var wire_length = wire_list[i].get_child(0)
		var port = wire_list[i].get_child(2)
		
		var spawn_area = Vector2(play_area.size * spawn_area_range)
		var spawn_area_difference = Vector2(play_area.size - spawn_area)

		wire_end.position = Vector2(
			randf() * spawn_area.x + play_area.position.x + spawn_area_difference.x/2,
			randf() * spawn_area.y + play_area.position.y + spawn_area_difference.y/2
		)

		wire_length.position = Vector2(play_area.position.x, play_area.position.y + play_area.size.y * (i+1)/(len(wire_list)+1) - wire_length.size.y/2)
		port.position = Vector2(play_area.position.x + play_area.size.x - port.size.x/2, play_area.position.y + play_area.size.y * (i+1)/(len(wire_list)+1) - port.size.y/2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for wire in wire_list:
		var wire_end = wire.get_child(1)
		var wire_length = wire.get_child(0)
		var port = wire.get_child(2)
		
		if wire_end.global_position.distance_to(port.global_position) < port.size.x / 2:
			wire_end.position = port.position + port.size/Vector2(2,2)  - wire_end.size/Vector2(2,2)
			wire_end.disabled = true
