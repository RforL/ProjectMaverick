extends KinematicBody2D

const FIREBALL = preload("res://Enemy/Enemy Bullet/EnemyBullet.tscn")

var speed = 20
var velocity = Vector2()
var player = null
export var direction = -1
export var detects_cliffs = true

var is_dead = false
var is_detected = false

func _ready():
	if direction == -1:
		$AnimatedSprite.flip_h = false
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$floor_checker.enabled = detects_cliffs
	

func dead():
	is_dead = true
	velocity = Vector2(0,0)
	$AnimatedSprite.play("Dead")
	$CollisionShape2D.disabled = true
	$Timer.start()

func _physics_process(delta):
	if is_dead == false:
		
		if is_on_wall() or not $floor_checker.is_colliding() and detects_cliffs and is_on_floor():
			direction = direction * -1
			$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
			$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
			
		velocity.y += 20
		
		velocity.x = speed * direction

		velocity = move_and_slide(velocity, Vector2.UP)

		if get_slide_count() > 0:
			for i in range (get_slide_count()):
				if "Player" in get_slide_collision(i).collider.name:
					get_slide_collision(i).collider.damage()

func _on_Timer_timeout():
	queue_free()


func _on_PlayerDetect_body_entered(body):
		player = body
		$AnimatedSprite.play("Shoot")
		var fireball = FIREBALL.instance()
		if sign($Position2D.position.x) == 1:
			fireball.set_fireball_direction(1)
		else:
			fireball.set_fireball_direction(-1)
		get_parent().add_child(fireball)
		fireball.position = $Position2D.global_position


func _on_PlayerDetect_body_exited(body):
	player = null
