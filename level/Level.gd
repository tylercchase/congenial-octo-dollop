extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal win
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_goal_goal():
	emit_signal("win")
	pass # Replace with function body.
