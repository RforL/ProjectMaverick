extends RichTextLabel

var dialog = ["wdawdawd", "test", "", ""] #0, 1, 2
var page = 0
var num1 = 0

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
				num1 += 1
				print(num1)
				
			if (num1 == 3):
				get_tree().change_scene("res://Levels/Level1/Level1.tscn")

					
		else:
			set_visible_characters(get_total_character_count())


func _on_Timer_timeout():
	set_visible_characters(get_visible_line_count()+1)
