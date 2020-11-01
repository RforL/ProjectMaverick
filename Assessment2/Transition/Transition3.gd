extends RichTextLabel

var dialog = ["After navigating through the harsh swamps of Louisiana", "He heads for fort Rucker, which has been overrun by bandits", ""]
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
				
			if (num == 2):
				get_tree().change_scene("res://Levels/Level3/Level3.tscn")
	


func _on_Timer_timeout():
	print("print")
	set_visible_characters(get_visible_characters()+1)