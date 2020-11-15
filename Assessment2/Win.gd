extends Control


func _ready():
	get_node("/root/Hud").get_child(0).hide()
	pass

func _on_Play_pressed():
	get_tree().change_scene("res://Levels/Level1/Level1.tscn")
	pass

func _on_Exit_pressed():
	get_tree().quit()
	pass
