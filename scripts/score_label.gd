extends Label

var score = 0

func _on_planet_captured():
	score += 5000;
	text = "Score: %s" % score
