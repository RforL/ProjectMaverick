extends Control

func _ready():
	get_node("/root/Hud").get_child(0).hide()

func _on_ContinueButton_pressed():
	get_tree().change_scene("res://Levels/Level1/Level1.tscn")
