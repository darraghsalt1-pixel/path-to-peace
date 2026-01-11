extends Control

@onready var character = get_node_or_null("../CharacterBody2D")

func show_menu():
	visible = true
	if character:
		character.set_physics_process(false)
		character.set_process(false)
