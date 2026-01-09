extends Camera2D

@onready var main_menu = get_node("/root/main/MainMenu")

func _ready():
	position = Vector2(0, 0)

func _process(_delta: float):  # Add underscore
	if main_menu:
		enabled = not main_menu.visible
