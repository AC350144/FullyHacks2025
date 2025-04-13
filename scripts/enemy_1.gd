extends Node2D

const SPEED = 50

var direction = 1

@onready var right_check = $Right_Check
@onready var left_check = $Left_Check

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if right_check.is_colliding():
		position.x += direction * (SPEED * 1.2) * delta
	if left_check.is_colliding():
		position.x += -direction * (SPEED * 1.2) * delta
	else:
		position.x += direction * SPEED * delta
	

func _on_timer_timeout() -> void:
	direction = -direction
	$AnimatedSprite2D.flip_h = direction < 0
	
