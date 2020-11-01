extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _ammo(bullet):
	$Control/NinePatchRect/ammoSprite.set_frame(bullet)
	$Control/NinePatchRect/ammoSprite.stop()
	
func _reload():
	$Control/NinePatchRect/ammoSprite.set_frame(0)
	$Control/NinePatchRect/ammoSprite.play()
	
func _healthbar(health):
		$Control/healthSprite.set_frame(health)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
