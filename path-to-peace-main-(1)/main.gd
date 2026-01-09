extends Node2D

var height = randi_range(100, 250)

func _ready():
	print("you are " + str(height) + "cm tall")
	print($CharacterBody2D/AnimatedSprite2D.position)
	
	# Connect button signal
	$MainMenu/Button.pressed.connect(_on_start_game)

func _on_start_game():
	$MainMenu.hide_menu()

func _process(_delta: float):
	pass
