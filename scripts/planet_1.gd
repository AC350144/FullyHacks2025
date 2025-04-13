extends Node2D

signal planet_changed(planet_name)

@export () var planet_name = "planet_one"

@onready var test_ray = $RayCast2D

func _physics_process(delta):
	if test_ray.is_colliding():
		print("Is colliding")
		emit_signal("planet_changed", planet_name) 
