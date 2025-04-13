extends CharacterBody2D

var max_oxygen := 100
var current_oxygen := 100

@onready var oxygen_bar := $OxygenBar
@onready var oxygen_loss = $Timer

# OXYGEN BAR FUNCTIONALITY

func _ready():
	update_oxygen_bar()
	oxygen_loss.wait_time = 1.0
	oxygen_loss.start()
	
func _on_timer_timeout():
	if current_oxygen > 0:
		current_oxygen -= 1
		 # Replace with function body.
	
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
	


#MOVEMENT AND GRAVITY FUNCTIONALITY

const SPEED = 200.0
const JUMP_VELOCITY = -300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
