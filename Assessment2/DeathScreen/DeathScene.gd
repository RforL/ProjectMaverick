extends Control

<<<<<<< HEAD
func _ready():
	get_node("/root/Hud").get_child(0).hide()

func _on_ContinueButton_pressed():
	get_tree().change_scene("res://Levels/Level1/Level1.tscn")
=======

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/Hud").get_child(0).hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ContinueButton_pressed():
	get_tree().change_scene("res://Levels/Level1/Level1.tscn")
	pass # Replace with function body.


func _on_ExitButton_pressed():
	get_tree().quit()
	pass # Replace with function body.
>>>>>>> 0ef3528a6df9caf67e664e4233cc95987760e8f6
