extends RichTextLabel


var dialog = ["After exploring the temples of Napel. Dag finds himself having to go to the deep depths of space.",
""]
var page = 0
var num1 = 0

#var startgame = get_tree().change_scene("res://Levels/Level1.tscn")

# Called when the node enters the scene tree for the first time.
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
				
			if (num1 == 1):
				get_tree().change_scene("res://Levels/Level2/Level2.tscn")

					
		else:
			set_visible_characters(get_total_character_count())
			
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#func _newfunction(event):
#	var num1 = 0
#	if event is InputEventMouseButton:
#		num1 + 1
#		if num1 == 2:
#			get_tree().change_scene("res://Levels/Level1.tscn")

	


func _on_Timer_timeout():
	set_visible_characters(get_visible_line_count()+1)
	pass # Replace with function body.
