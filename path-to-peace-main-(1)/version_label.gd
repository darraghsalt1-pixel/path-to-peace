extends Label

@onready var main_menu = get_parent()  # MainMenu is the parent!

func _ready():
	visible = true

func _process(_delta: float):  # Add underscore to ignore unused parameter
	if main_menu:
		visible = main_menu.visible
