extends Node2D

@onready var parallax_background: ParallaxBackground = $ParallaxBackground

const SCROLL_SPEED : float = 200.0; # px / second

func _process(delta: float):
	parallax_background.scroll_offset.x -= delta * SCROLL_SPEED
