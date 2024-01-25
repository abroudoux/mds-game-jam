extends Timer

signal game_over

func _ready():
	pass

func _process(_delta):
	pass

func _on_timeout():
	emit_signal("game_over")
