extends Node2D

@onready var test_ray = $RayCast2D

func _physics_process(delta):
	if test_ray.is_colliding():
		var collider = test_ray.get_collider()
		if collider.name == "Player":
			collider.get_hit(10)
