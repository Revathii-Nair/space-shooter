extends Control

var level_scene: PackedScene = load("res://Scenes/level.tscn")
var menu_scene: PackedScene = load("res://Scenes/menu.tscn")

func _ready() -> void:
	var rng := RandomNumberGenerator.new()
	
	for i in rng.randi_range(20,50):
		var newSprite = AnimatedSprite2D.new()
		newSprite.sprite_frames = $Stars/StarImage.sprite_frames
		$Stars.add_child(newSprite)
		newSprite.frame = rng.randi_range(0,23)
	
	for star in $Stars.get_children():
		var rand_x := rng.randf_range(0,size.x)
		var rand_y := rng.randf_range(0,size.y)

		star.position = Vector2(rand_x,rand_y)
		star.play() 

func _process(_delta: float) -> void:
	if(Input.is_action_just_pressed("start")):
		$ConfirmMusic.play()
		await get_tree().create_timer(0.2).timeout
		get_tree().change_scene_to_packed(level_scene)
	if(Input.is_action_just_pressed("menu")):
		$ConfirmMusic.play()
		await get_tree().create_timer(0.2).timeout
		get_tree().change_scene_to_packed(menu_scene)
		
