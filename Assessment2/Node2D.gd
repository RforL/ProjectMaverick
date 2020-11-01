extends Node2D


func _ready():
	get_node("/root/Hud").queue_free()
	pass
