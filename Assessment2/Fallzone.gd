extends Area2D

export(String, FILE, "*.tscn") var world_scene

func _on_Fallzone_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
		queue_free()
