extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal startShooting
# Called when the node enters the scene tree for the first time.
func _ready():
	$Level.hide()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func new_game():
	$Player.start($Level/PlayerStart.position)
	$Level.show()
	
func _physics_process(delta):
	var space_state = get_world_2d().direct_space_state
    # use global coordinates, not local to node
	var result = space_state.intersect_ray($Player.global_position, $Level/Mob.global_position, [self],$Level/TileMap.collision_mask)
	if $Player.global_position.distance_to($Level/Mob.global_position) < 250:
			emit_signal("startShooting")
			print("CLOSE")
	#if result:
		#print("Hit at point: ", result.position)
		
	pass
func _on_HUD_start_game():
	new_game()
	pass # Replace with function body.
