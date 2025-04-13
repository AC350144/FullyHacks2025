extends Control

signal planet_changed(planet_name)

@export () var planet_name = "main_menu"

func _ready():
	$MenuMusic.play()

func _on_play_pressed() -> void:
	emit_signal("planet_changed", planet_name + "_play") #options will be + "_options"
	#get_tree().change_scene_to_file("game_scene_here")

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/options.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()	

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
