extends Node2D

const SPEED = 50
var direction = 1

@onready var right_check = $Right_Check
@onready var left_check = $Left_Check

func _ready():
	$Left_Ground_Check.position = Vector2(-10, 0)
	$Right_Ground_Check.position = Vector2(10, 0)
	$Left_Ground_Check.target_position = Vector2(0, 20)
	$Right_Ground_Check.target_position = Vector2(0, 20)

func _process(delta):
	var player_detected = false
	
	if direction == 1 and not $Right_Ground_Check.is_colliding():
		turn_around()
		
	elif direction == -1 and not $Left_Ground_Check.is_colliding():
		turn_around()
		
	
	if right_check.is_colliding():
		player_detected = true
	elif left_check.is_colliding():
		player_detected = true
	
	if player_detected:
		position.x += direction * (SPEED * 1.5) * delta
	else:
		position.x += direction * SPEED * delta
		
func _on_timer_timeout() -> void:
	direction = -direction
	$AnimatedSprite2D.flip_h = direction < 0

func turn_around():
	direction = -direction
	$AnimatedSprite2D.flip_h = direction < 0
	# Replace with function body.
