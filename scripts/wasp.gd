extends Area2D

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	animated_sprite.animation = "default";
	
func _process(_delta):
	pass
	
func _on_capture():
	animated_sprite.animation = "capture";
