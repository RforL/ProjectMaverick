extends RichTextLabel

var dialog = ["The farm has been clensed of the bandits.", "He heads towards his final destination, the city", ""]
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
				get_tree().change_scene("res://Levels/Level6/Level6.tscn")
	


func _on_Timer_timeout():
	print("print")
	set_visible_characters(get_visible_characters()+1)

