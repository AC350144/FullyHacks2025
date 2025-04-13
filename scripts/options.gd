extends Control
#OPTIONS 
func _on_volume_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)

func _on_mute_toggled(toggle_on: bool):
	var music_bus = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(music_bus, toggle_on)

func _on_back_button_pressed() -> void:
	pass # Replace with function body.
