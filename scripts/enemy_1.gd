extends Node2D

const SPEED = 50

var direction = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += direction * SPEED * delta
	

func _on_timer_timeout() -> void:
	direction = -direction
	$AnimatedSprite2D.flip_h = direction < 0	
