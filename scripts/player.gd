extends Area2D;

@export var speed = 150;

@onready var audio_stream_player : AudioStreamPlayer = get_node("audio_stream_player");

var screen_size;
var is_on_planet_kepler : bool = false

signal _on_planet_entered(planet_name)
signal _on_planet_exited(planet_name)

func start(pos):
	position = pos;
	show();
	#$CollisionShape2D.disabled = false;

func _ready():
	connect("area_entered", _on_planet_body_entered)
	connect("area_exited", _on_planet_body_exited)
	screen_size = get_viewport_rect().size;
	#audio_stream_player.play();
	
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1;
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1;
	if Input.is_action_pressed("move_down"):
		velocity.y += 1;
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1;

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed;
		$AnimatedSprite2D.play();
	else:
		$AnimatedSprite2D.stop();
		
	position += velocity * delta;
	position = position.clamp(Vector2.ZERO, screen_size);
		
	if velocity.x != 0 or velocity.y != 0:
		$AnimatedSprite2D.flip_h = velocity.x < 0;
		$AnimatedSprite2D.flip_v = velocity.y > 0;

	if velocity.x != 0 and velocity.y != 0:
		$AnimatedSprite2D.animation = "up_right";
	elif velocity.x != 0:
		$AnimatedSprite2D.animation = "right";
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "up";

func _on_planet_body_entered(body):
	if body is Area2D and "planet_name" in body:
		var planet_name = body.planet_name
		emit_signal("_on_planet_entered", planet_name)

func _on_planet_body_exited(body):
	if body is Area2D and "planet_name" in body:
		var planet_name = body.planet_name
		emit_signal("_on_planet_exited", planet_name)
