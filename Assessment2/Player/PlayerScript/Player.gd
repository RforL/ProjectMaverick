extends KinematicBody2D

const up = Vector2(0, -1)
const maxspeed = 150
const gravity = 20
const acceleration = 50
const jump = -450
const FIREBALL = preload("res://Player/Bullet/Bullet.tscn")

var motion = Vector2() #motion.x, motion.y 

var on_ground = false

var attac = false

func _physics_process(delta):
	
	motion.y += gravity
	var friction = false
	
	if Input.is_action_pressed("ui_right"):	
		if attac == false || is_on_floor() == false:	
			motion.x = min(motion.x + acceleration, maxspeed)
			if attac == false:
				$Sprite.flip_h = false #flip sprite to face direction
				$Sprite.play("Run")
				if sign($Position2D.position.x) == -1:
					$Position2D.position.x *= -1
		if is_on_floor() && Input.is_action_just_pressed("ui_right"):
			$AudioStreamPlayer.play()
		if is_on_floor() == false && Input.is_action_just_pressed("ui_right"):
			$AudioStreamPlayer.stop() 
		
	elif Input.is_action_pressed("ui_left"):
		if attac == false || is_on_floor() == false:	
			motion.x = max(motion.x - acceleration, -maxspeed)
			if attac == false:
				$Sprite.flip_h = true #flip sprite to face direction
				$Sprite.play("Run")
				if sign($Position2D.position.x) == 1:
					$Position2D.position.x *= -1
		if is_on_floor() && Input.is_action_just_pressed("ui_left"):
			$AudioStreamPlayer.play()
		if is_on_floor() == false && Input.is_action_just_pressed("ui_left"):
			$AudioStreamPlayer.stop() 
		
	else:
		if attac == false:
			$Sprite.play("Idle")
			friction = false
			motion.x = lerp(motion.x, 0, 1)
		$AudioStreamPlayer.stop()
		
	if is_on_floor():
		if on_ground == false:
				attac = false
		on_ground = true
		if attac == false:
			on_ground = false
			if Input.is_action_just_pressed("ui_up") || is_on_floor() == false:
				$AudioStreamPlayer3.play()
				motion.y = jump
			if friction == true:
				motion.x = lerp(motion.x, 0, 0.1)
			
	# use move_and_slide to create movement on screen
	else:
		if attac == false:
			if motion.y < 0:
				$Sprite.play("Jump")
			else:
				$Sprite.play("Fall")
	
	motion = move_and_slide(motion, up)
	
	if Input.is_action_just_pressed("ui_focus_next") && attac == false:
		if is_on_floor():
			motion.x = 0
		attac = true
		$Sprite.play("Fire")
		var fireball = FIREBALL.instance()
		if sign($Position2D.position.x) == 1:
			fireball.set_fireball_direction(1)
		else:
			fireball.set_fireball_direction(-1)
		get_parent().add_child(fireball)
		fireball.position = $Position2D.global_position
		
		if Input.is_action_just_pressed("ui_focus_next"):
			$AudioStreamPlayer2.play()
			
	


func _on_fallzone_body_entered(body):
	get_tree().change_scene("res://Levels/Level1.tscn")
	pass # Replace with function body.
	
	

func _on_Sprite_animation_finished():
	attac = false
	pass # Replace with function body.
