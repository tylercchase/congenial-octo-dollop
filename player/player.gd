extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal hit

export var speed = 400
var screen_size
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		pass
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	
	if velocity.length() > 0:
        velocity = velocity.normalized() * speed
        $AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	move_and_collide(velocity * delta)
	if velocity.x != 0:
		$AnimatedSprite.animation = "right"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "up"
		if velocity.y > 0:
			$AnimatedSprite.animation = "down"
	pass


func _on_Player_body_entered(body):
	print(body.get_name())
	if body.get_name() == "Wall":
		pass
	else:
		hide()
		emit_signal("hit")
		$hitbox.set_deferred("disabled",true)
	
func start(pos):
	position = pos
	show()