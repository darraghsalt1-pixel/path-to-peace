extends Control

@onready var character = get_node_or_null("../CharacterBody2D")

func _ready() -> void:
	if character:
		character.set_physics_process(false)
		character.set_process(false)
	visible = true

func _process(_delta: float) -> void:  # Add underscore
	if Input.is_action_just_pressed("ui_cancel") and not visible:
		show_menu()

func hide_menu():
	visible = false
	if character:
		character.set_physics_process(true)
		character.set_process(true)

func show_menu():
	visible = true
	if character:
		character.set_physics_process(false)
		character.set_process(false)
