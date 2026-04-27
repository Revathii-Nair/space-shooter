extends Node2D

var health = 3

#1. Load the scene
var meteor_scene: PackedScene = load("res://Scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://Scenes/laser.tscn")

func _ready() -> void:
	get_tree().call_group('ui','set_health',health)

# to randomize meteor creation
func _on_meteor_timer_timeout() -> void:
	#2. Create an instance
	var meteor = meteor_scene.instantiate()
	#3. Attach the node to the scene tree
	$Meteors.add_child(meteor)
	
	# since we are creating meteor nodes through code we need to connect custom signals using connect
	meteor.connect('collision',_on_meteor_collision)
	
# health updation and changing layout to game over layout 
func _on_meteor_collision():
	health -= 1
	get_tree().call_group('ui','set_health',health)
	if health <=0:
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")	


# custom signal function from player scene
func _on_player_laser(pos: Variant) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
