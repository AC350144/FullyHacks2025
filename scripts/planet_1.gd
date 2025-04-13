extends Node2D

@onready var test_ray = $RayCast2D

func _physics_process(delta):
	if test_ray.is_colliding():
		emit_signal("planet_changed", planet_name) 
