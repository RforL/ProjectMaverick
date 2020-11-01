extends KinematicBody2D

const up = Vector2(0, -1)
const maxspeed = 200
const gravity = 20
const acceleration = 120
const jump = -700
const FIREBALL = preload("res://Player/Bullet/Bullet.tscn")

var motion = Vector2() #motion.x, motion.y 
var health = 5
var on_ground = false
var bullets = 6
var shootable = true
var attac = false
var damagable = true

func _physics_process(delta):
	
	motion.y += gravity
	var friction = false
	
	if Input.is_action_pressed("ui_right") && !Input.is_action_pressed("ui_down"):	
		if attac == false || is_on_floor() == false:	
			motion.x = min(motion.x + acceleration, maxspeed)
			if attac == false:
				$AnimatedSprite.flip_h = false
				$AnimatedSprite.play("Walk")
				if sign($Position2D.position.x) == -1:
					$Position2D.position.x *= -1


		
	elif Input.is_action_pressed("ui_left") && !Input.is_action_pressed("ui_down"):
		if attac == false || is_on_floor() == false:
			motion.x = max(motion.x - acceleration, -maxspeed)
			if attac == false:
				$AnimatedSprite.flip_h = true
				$AnimatedSprite.play("Walk")
				if sign($Position2D.position.x) == 1:
					$Position2D.position.x *= -1


		
	else:
		if attac == false:
			$AnimatedSprite.play("Idle")
			friction = false
			motion.x = lerp(motion.x, 0, 1)

		
	if is_on_floor():
		if on_ground == false:
				attac = false
		on_ground = true
		if attac == false:
			on_ground = false
			if Input.is_action_just_pressed("ui_up") || is_on_floor() == false:
				if Input.is_action_just_pressed("ui_up"):
					$jump.play() 
				motion.y = jump
			if friction == true:
				motion.x = lerp(motion.x, 0, 0.1)
			
	# use move_and_slide to create movement on screen
	else:
		if attac == false:
			if motion.y < 0:
				$AnimatedSprite.play("Jump")
			else:
				$AnimatedSprite.play("Fall")
	
	motion = move_and_slide(motion, up)
	
	if Input.is_action_just_pressed("ui_focus_next") && attac == false && shootable == true:
		if is_on_floor():
			motion.x = 0
		bullets -= 1
		checkammo()
		attac = true
		$AnimatedSprite.play("Shoot")
		var fireball = FIREBALL.instance()
		if sign($Position2D.position.x) == 1:
			fireball.set_fireball_direction(1)
		else:
			fireball.set_fireball_direction(-1)
		get_parent().add_child(fireball)
		fireball.position = $Position2D.global_position
	elif Input.is_action_just_pressed("ui_focus_next") && attac == false && shootable == false:
		$dryfire.play()
		
	if Input.is_action_pressed("ui_down") && attac == false:
		if is_on_floor():
			motion.x
		attac = true
		$AnimatedSprite.play("Duck")
		if Input.is_action_pressed("ui_focus_next") && Input.is_action_pressed("ui_down") && shootable == true:
			$AnimatedSprite.play("Duckshoot")
	

func checkammo():
	$gunshot.play()
	if bullets == 0:
		shootable = false
		#reloading sound here 
		#reload UI animation here
		get_node("/root/Hud")._reload()
		yield(get_tree().create_timer(3.5), "timeout")
		bullets = 6
		shootable = true
	get_node("/root/Hud")._ammo(bullets)
	pass
		
func _on_AnimatedSprite_animation_finished():
	attac = false
	pass # Replace with function body.
	
func heal():
	if health == 5:
		pass
	if health == 4:
		health = 5
		get_node("/root/Hud")._healthbar(health)
	if health < 4:
		health += 2
		get_node("/root/Hud")._healthbar(health)
		
	
func damage():
	if damagable == true:
		damagable = false
		health -= 1
		$pain.play()
		print(health) #debug
		if health == 0:
			print("Death Here!") #trigger death sound and screen
			get_tree().change_scene("res://DeathScreen/DeathScene.tscn")
		#get_node("root/HUD").reload
		get_node("/root/Hud")._healthbar(health)
		#yield(get_tree().create_timer(1), "timeout") #timer to see if maverick is getting rekt by colliding with someone
		damagable = true
		
func _ready():
	health = 5
	get_node("/root/Hud").get_child(0).show()
	get_node("/root/Hud")._healthbar(health)
		


