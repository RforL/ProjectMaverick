extends Polygon2D


func _ready():
	$AudioStreamPlayer2D.play()
	get_node("/root/Hud/").get_child(0).hide()
	
	pass
