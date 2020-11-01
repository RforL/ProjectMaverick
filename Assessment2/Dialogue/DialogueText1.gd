extends RichTextLabel

var dialog = ["Maverick was a sheriff back in his prime. A good man, Maverick was a law abiding citizen who loved to protect his town. Now off duty, Maverick spends his time with his loving family at his ranch. In his spare time he loves to hunt.", ""]
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
				get_tree().change_scene("res://Dialogue/Dialogue2.tscn")
	


func _on_Timer_timeout():
	print("print")
	set_visible_characters(get_visible_characters()+1)
