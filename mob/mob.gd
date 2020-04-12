extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var follow = PathFollow2D.new()
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func shoot():
	var dir = get_parent().get_parent().get_node(".").global_position - global_position

func _on_startShooting():
	print("ASDASD")
	pass

func hit():
	print("I'm HIT")

func _on_Area2D_area_entered(area):
	pass # Replace with function body.
