extends CharacterBody2D

var max_oxygen := 100
var current_oxygen := 100

@onready var oxygen_bar := $OxygenBar

# OXYGEN BAR FUNCTIONALITY

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
	var current_scene = get_tree().current_scene
	get_tree().reload_current_scene()
	#we can slow down game speed, remove collision, and then restart game
	#we can also move them to main menu scene or perhaps just the first level scene
	


#MOVEMENT AND GRAVITY FUNCTIONALITY

const SPEED = 150.0
const JUMP_VELOCITY = -300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED	
		#play walking animation based on L or R
		if direction > 0:
			$AnimatedSprite2D/AnimationPlayer.play("walkingR")
		else:
			$AnimatedSprite2D/AnimationPlayer.play("walkingL")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if $AnimatedSprite2D/AnimationPlayer.current_animation != "idle":
			$AnimatedSprite2D/AnimationPlayer.play("idle")
		
	move_and_slide()

#func movement_animated():
	#if Input.is_action_pressed("ui_right"):
		#$AnimatedSprite2D/AnimationPlayer.play("walkingR")
