extends Area2D

@onready var collision_box = $Collision_Box

func _on_body_entered(body):
	if body.name == "Player":
		body.get_hit(10)
