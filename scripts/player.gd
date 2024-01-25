extends Area2D;

@export var speed = 300;

var screen_size;
var is_on_planet_kepler : bool = false

signal planet_kepler_body_entered;
signal planet_kepler_body_exited;
signal planet_wasp_body_entered;
signal planet_wasp_body_exited;
signal planet_gj_body_entered;
signal planet_gj_body_exited;

func start(pos):
	position = pos;
	show();
	$CollisionShape2D.disabled = false;

func _ready():
	connect("area_entered", _on_planet_kepler_body_entered);
	connect("area_exited", _on_planet_kepler_body_exited);
	connect("area_entered", _on_planet_wasp_body_entered);
	connect("area_exited", _on_planet_wasp_body_exited);
	connect("area_entered", _on_planet_gj_body_entered);
	connect("area_exited", _on_planet_gj_body_exited);
	screen_size = get_viewport_rect().size;
	
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

func _on_planet_kepler_body_entered(area):
	emit_signal("planet_kepler_body_entered");

func _on_planet_kepler_body_exited(area):
	emit_signal("planet_kepler_body_exited");
	
func _on_planet_wasp_body_entered(area):
	emit_signal("planet_wasp_body_entered");

func _on_planet_wasp_body_exited(area):
	emit_signal("planet_wasp_body_exited");

func _on_planet_gj_body_entered(area):
	emit_signal("planet_gj_body_entered");

func _on_planet_gj_body_exited(area):
	emit_signal("planet_gj_body_exited");
