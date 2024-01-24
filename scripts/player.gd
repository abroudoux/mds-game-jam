extends Area2D

@export var speed = 300
@export var interacter : Node2D

var screen_size

signal player_body_entered

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

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
		print("animation vers le haut !!!")
	elif velocity.x != 0:
		$AnimatedSprite2D.animation = "right"
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "up"

func _on_body_entered(body):
	emit_signal("player_body_entered", body)
