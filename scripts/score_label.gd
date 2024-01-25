extends Label

var score = 0

func _ready():
	add_theme_font_size_override("font_size", 10)

func _on_planet_captured():
	score += 5000;
	text = "Score: %s" % score
