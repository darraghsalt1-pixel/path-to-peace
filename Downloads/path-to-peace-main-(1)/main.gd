extends Node2D

func _ready():
	$DeathScreen.visible = false
	# Connect button signal
	$MainMenu/Button.pressed.connect(_on_start_game)

func _on_start_game():
	$MainMenu.hide_menu()

func _process(_delta):
	pass
