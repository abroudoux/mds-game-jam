extends Node2D

var player : Node2D
var background : Node2D

func _ready():
	player = $player
	background = $background

	player.position = get_viewport_rect().size / 2

	background.position = get_viewport_rect().size / 2
