extends Area2D;

@export var planet_name = "gj";

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D;
@onready var audio_stream_player : AudioStreamPlayer = get_node("audio_stream_player");

var captured : bool = false;

signal planet_captured;

func _ready():	
	if animated_sprite:
		animated_sprite.play("default");

func _process(_delta):
	pass;

func _on_capture():
	if not captured:
		animated_sprite.play("capture");
		captured = true;
		emit_signal("planet_captured");
		audio_stream_player.play();
	else:
		animated_sprite.play("captured");

func _on_player_exited():
	if not captured:
		animated_sprite.stop();
		animated_sprite.play("default");
		audio_stream_player.stop();
	else:
		animated_sprite.play("captured");

