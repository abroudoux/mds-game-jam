extends Area2D

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	if animated_sprite:
		animated_sprite.play("default");

func _process(_delta):
	pass

func _on_capture():
	animated_sprite.play("capture");
