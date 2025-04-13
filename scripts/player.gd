extends CharacterBody2D

var max_oxygen := 100
var current_oxygen := 100

@onready var oxygen_bar := $OxygenBar

func _ready():
	update_oxygen_bar()
	
func get_hit(damage: int):
	current_oxygen = max(current_oxygen - damage, 0)
	update_oxygen_bar()
	if current_oxygen == 0:
		death()
		
func heal():
	current_oxygen = 100
	update_oxygen_bar()
	
func update_oxygen_bar():
	oxygen_bar.value = current_oxygen
	
func death():
	pass
	#we can slow down game speed, remove collision, and then restart game
	#we can also move them to main menu scene or perhaps just the first level scene
