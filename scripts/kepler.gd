extends Area2D

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

func _ready():	
	connect("area_entered", _on_kepler_capture)
	if animated_sprite:
		animated_sprite.play("default");

func _process(_delta):
	pass

func _on_kepler_capture():
	print("capture")
	animated_sprite.play("capture");
