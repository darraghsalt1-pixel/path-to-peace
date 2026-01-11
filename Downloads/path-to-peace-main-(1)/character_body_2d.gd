extends CharacterBody2D


const SPEED = 220.0
const JUMP_VELOCITY = -340.0

func character_info():
	pass

var spawn_position = Vector2(0, 0)

func _ready():
	spawn_position = position  # Save starting position

func _process(delta):
	if position.y > 290:
		die()
		
func die():
	$"../DeathScreen".visible = true
	position = spawn_position  # Reset to start
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
