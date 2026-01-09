@tool
extends CharacterBody2D


#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0

@export_category("Movement")
@export var max_speed = 300.0
@export var acceleration = 700.0
@export var deceleration = 1400.0
@export_range(0,1000) var air_acceleration:float = 500.0
@export_range(0,1000) var max_fall_speed:float = 250.0

@export_category("Jump")
@export_range(0,1000) var jump_height:float = 50.0
@export_range(0.1, 2, 0.1) var jump_time_to_peak:float = 0.37
@export_range(0.1,2, 0.1) var jump_time_to_descend:float = 0.2
@export_range(0,250) var jump_horizontal_distance:float = 80.0
@export_range(0,20) var jump_cancel_divider:float = 15.0


@onready var fall_gravity:float = calculate_fall_gravity(jump_height, jump_time_to_descend)
@onready var jump_speed:float = calculate_jump_speed(jump_height, jump_time_to_peak)
@onready var jump_gravity:float = calculate_jump_gravity(jump_height, jump_time_to_peak)
@onready var jump_horizontal_speed:float = calculate_jump_horizontal_speed(jump_horizontal_distance, jump_time_to_peak, jump_time_to_descend)


@onready var current_gravity = fall_gravity
@onready var current_speed = max_speed
var is_falling = false
func _physics_process(delta: float) -> void:
	if Engine.is_editor_hint():
		return
	var horizontal_direction:float = Input.get_axis("move_left", "move_right")
	
	if is_on_floor():
		if is_falling:
			#Transition from falling to grounded
			is_falling = false
			current_speed = max_speed
		elif Input.is_action_pressed("jump"):
			#Transition from grounder to jumping
			velocity.y = jump_speed
			current_gravity = jump_gravity	
			current_speed = jump_horizontal_speed
	else:
		#if it still going up. then is still jumping,
		#else transition to falling
		var is_jumping = velocity.y < 0
		if not is_jumping:
			is_falling = true
			current_gravity = fall_gravity
	
	
	#apply horizontal movement
	if horizontal_direction == 0:
		velocity.x = move_toward(velocity.x, 0.0, delta * deceleration)
	else:
		#If we want acceleration we have to add it there
		velocity.x += current_speed * horizontal_direction
		velocity.x = clampf(velocity.x, -current_speed, current_speed)
	
	
	#Apply gravity
	#Gravity speed is limited to max_fall_speed
	velocity.y += current_gravity * delta
	velocity.y = minf(velocity.y, max_fall_speed)
	
	
	
	
	
	move_and_slide()




#Functions to calculate jump parameters
func calculate_jump_speed(height:float, time_to_peak:float) -> float:
	return - (2.0 * height) / time_to_peak

func calculate_jump_gravity(height:float, time_to_peak:float) -> float:
	return (2 * height) / pow(time_to_peak, 2.0)

func calculate_fall_gravity(height:float, time_to_descend:float) -> float:
	return (2 * height) / pow(time_to_descend, 2.0)

func calculate_jump_horizontal_speed(distance:float, time_to_peak:float, time_to_descend:float) -> float:
	return distance / (time_to_peak + time_to_descend)
