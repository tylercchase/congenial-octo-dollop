extends StaticBody2D

var Fireball = preload("res://mob/mobFireball.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var health = 30
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func shoot(target):
	var dir = target.global_position - global_position
	var b = Fireball.instance()
	b.setSpeed(500)
	b.start($AnimatedSprite.global_position, dir.angle())
	get_parent().add_child(b)
	pass
	
	print("ASDASD")
	pass

func hit():
	health -= 10
	if health <= 0:
		get_parent().remove_child(self)
	



func _on_AgroRange_body_entered(body):
	print(body.global_position)
	print("YOP")
	shoot(body)
	pass # Replace with function body.
