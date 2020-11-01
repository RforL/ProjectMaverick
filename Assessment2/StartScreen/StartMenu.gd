extends Control


func _ready():
	get_node("/root/Hud").queue_free()
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Dialogue/Dialogue1.tscn")
	pass # Replace with function body.
