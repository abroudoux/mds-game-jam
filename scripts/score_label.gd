extends Label

var score = 0

func _ready():
	pass

func _process(_delta):
	pass

func _on_kepler_captured():
	score += 50
	text = "Score: %s" % score
