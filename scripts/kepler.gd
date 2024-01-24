extends Area2D

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

signal captured

func _ready():
	$AnimatedSprite2D.animation = "default"

func _process(_delta):
	pass

func _on_player_body_entered(body):
	emit_signal("captured", body)

func on_capture():
	$AnimatedSprite2D.animation("capture")
