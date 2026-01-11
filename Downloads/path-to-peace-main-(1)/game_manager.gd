extends Node

### main character info ###
var main_character_name = "unknown" # this is unknown until a later point in the game
var health = 100
var memories_unlocked = 0 # change when a memory gets completed
var wounded_saved = 0
var wounded_couldnt_save = 0

func _procces(_delta):
	if health > 100:
		health = 100
