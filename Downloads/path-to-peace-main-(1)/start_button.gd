extends Button

func _ready():
	pressed.connect(_on_pressed)

func _on_pressed():
	get_parent().hide_menu()
	print("your name is " + str(GameManager.main_character_name))
