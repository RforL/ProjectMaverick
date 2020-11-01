extends Control


func _ready():
	get_node("/root/Hud").queue_free()
	pass
