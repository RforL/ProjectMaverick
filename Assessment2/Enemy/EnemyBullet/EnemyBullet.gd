extends Area2D

const speed = 500
var velocity = Vector2()
var direction = 1
var player = load("res://Player/PlayerScript/Player.gd").new()

func _ready():
	pass

func set_fireball_direction(dir):
	direction = dir
	if dir == -1:
		$AnimatedSprite.flip_v = true
	
func _physics_process(delta):
	velocity.x = speed * delta * direction
	translate(velocity)
	$AnimatedSprite.play("Bullet")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Bullet_body_entered(body):
	#if "Player" in body.name:
		#player.damage()
	get_node("/root/Node2D/Player").damage()
	queue_free()
