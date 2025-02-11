extends Node2D

@onready var wire = $wire_length
@onready var wire_end = $wire_end

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	wire.pivot_offset.y = wire.size.y/2
	# Ensure the wire is updated every frame
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var start_pos = wire.position
	var end_pos = Vector2(wire_end.position.x + wire_end.size.x/2, wire_end.position.y + wire_end.size.y/2 - wire.size.y/2)
	var distance = start_pos.distance_to(end_pos)
	
	wire.size.x = distance
	wire.rotation = (end_pos - start_pos).angle()
	# wire_end.rotation = wire.rotation # Breaks clickability
