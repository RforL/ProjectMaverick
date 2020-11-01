extends Control


func _ready():
	get_node("/root/Hud").get_child(0).hide()
	pass


func _on_Button_pressed():
	get_tree().change_scene("res://Dialogue/Dialogue1.tscn")
	pass # Replace with function body.
	
	


func _on_Button3_pressed():
	get_tree().quit()
	pass # Replace with function body.
