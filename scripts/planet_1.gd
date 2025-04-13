extends Node2D

signal planet_changed(planet_name)

@export () var planet_name = "planet_one"

@onready var test_ray = $RayCast2D


func _physics_process(delta):
	if test_ray.is_colliding():
		var collider = test_ray.get_collider()
		if collider.name == "Player":
			emit_signal("planet_changed", planet_name)
