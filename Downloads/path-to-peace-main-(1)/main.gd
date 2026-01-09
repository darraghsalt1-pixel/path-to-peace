extends Node2D

func _ready():
	
	# Connect button signal
	$MainMenu/Button.pressed.connect(_on_start_game)

func _on_start_game():
	$MainMenu.hide_menu()

func _process(_delta: float):
	pass
