extends Node

@onready var current_planet = $"Main Menu"

func _ready() -> void:
	$"Main Menu".connect("planet_changed", doing_planet_changed)
	
func doing_planet_changed(current_planet_name: String):
	var next_planet
	var next_planet_name: String
	
	match current_planet_name:
		"main_menu_play":
			next_planet_name = "1"
		"main_menu_options":
			next_planet_name = ""
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
