extends Node

@onready var current_planet = $planet1

func _ready() -> void:
	$planet1.connect("planet_changed", doing_planet_changed)
	
func doing_planet_changed(current_planet_name: String):
	var next_planet
	var next_planet_name: String
	
	match current_planet_name:
		"main_menu_play":
			next_planet_name = "1"
		"planet_one":
			next_planet_name = "2"
		
		_:
			return
			
	var temp = load("res://scenes/planet" + next_planet_name + ".tscn")
	next_planet = temp.instantiate()
	call_deferred("add_child", next_planet)
	next_planet.connect("planet_changed", doing_planet_changed)
	current_planet.queue_free()
	current_planet = next_planet
