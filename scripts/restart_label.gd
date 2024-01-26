extends Label

signal restart_game

func _ready():
	set_process_input(true)

func _process(delta):
	pass
	
func _input(event):
	if event is InputEventMouseButton:
		emit_signal("restart_game");
