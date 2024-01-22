extends Area2D

@export var speed = 400

func _ready():
	var screen_size = get_viewport_rect().size
	position = screen_size / 2
