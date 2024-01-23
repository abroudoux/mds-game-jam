extends Node2D

@export var speed = 400
var screen_size
var player : Node

func _ready():
	screen_size = get_viewport_rect().size

	position = screen_size / 2

func _process(delta):
	pass
	
