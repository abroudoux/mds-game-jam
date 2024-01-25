extends Area2D

@export var speed = 300

var screen_size

signal planet_body_entered

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _ready():
	connect("area_entered", _on_planet_body_entered)
	screen_size = get_viewport_rect().size
	
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		print("player is ready")
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		print("player is ready")
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		print("player is ready")
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		print("player is ready")

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
		
	if velocity.x != 0 or velocity.y != 0:
		$AnimatedSprite2D.flip_h = velocity.x < 0
		$AnimatedSprite2D.flip_v = velocity.y > 0

	if velocity.x != 0 and velocity.y != 0:
		$AnimatedSprite2D.animation = "up_right"
	elif velocity.x != 0:
		$AnimatedSprite2D.animation = "right"
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "up"

func _on_planet_body_entered():
	print("azeaezzzz")
	emit_signal("planet_body_entered")
