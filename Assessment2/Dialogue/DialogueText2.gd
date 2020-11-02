extends RichTextLabel

var dialog = ["While out hunting, Maverick returned home to find the ranch destroyed and his family gone. Bandits have taken Mavericks family captive. Finding nothing but a letter, Maverick is now on the hunt for these bandits.", ""]
var page = 0
var num = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)
	
func _input(event):
	if event is InputEventMouseButton:
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
				num += 1
				print(num)
				
			if (num == 1):
				get_tree().change_scene("res://Dialogue/Dialogue3.tscn")
	


func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
