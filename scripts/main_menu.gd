extends Control

signal planet_changed(planet_name)

@export () var planet_name = "main_menu"

func _on_play_pressed() -> void:
	emit_signal("planet_changed", planet_name + "_play") #options will be + "_options"
	#get_tree().change_scene_to_file("game_scene_here")


func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()	
