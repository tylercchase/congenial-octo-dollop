extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 750
var velocity = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func start(pos, dir):
	rotation = dir
	$Sprite.rotation = get_global_mouse_position().angle_to_point(position) + 160

	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)
func setSpeed(setSpeed):
	speed = setSpeed
	
func _physics_process(delta):
	if speed < 0:
		get_parent().remove_child(self)
		pass
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		if collision.collider.has_method("hit"):
			collision.collider.hit()
			get_parent().remove_child(self)
		if collision.collider is TileMap:
			get_parent().remove_child(self)
	speed = speed - 25


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass
