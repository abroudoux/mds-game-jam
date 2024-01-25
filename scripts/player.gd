extends Area2D

@onready var healthbar = $HealthBar
@export var speed = 300
var screen_size
var health 

func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
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
	elif velocity.x != 0:
		$AnimatedSprite2D.animation = "right"
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "up"


func _process1(delta: float) -> void:
	$TimeRemaining.text = "%s" % roundf($FlashTimer.time_left)

func _on_flash_timer_timeout() -> void:
	toggle_icon_visibility()
	
func toggle_icon_visibility():
	if $AnimatedSprite2D.visible:
		$AnimatedSprite2D.hide()
	else: 
		$AnimatedSprite2D.show()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		$FlashTimer.paused() = !$FlashTimer.paused
			
		#toggle_icon_visibility()
		#$FlashTimer.start()
		
	
