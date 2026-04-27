extends Area2D

var rotation_speed: float
var movement_speed: int
var direction_x: float

signal collision

func _ready() -> void:
	
	var rng := RandomNumberGenerator.new()
	
	# random meteor graphics
	var path: String = "res://Graphics/Meteors/meteorBrown_big"+str(rng.randi_range(1,4))+".png"
	$MeteorImage.texture = load(path)
	
	# start position
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0,width);
	var random_y = rng.randi_range(-150,-50)
	position = Vector2(random_x,random_y)
	
	# speed / rotation / direction
	rotation_speed = rng.randf_range(0,5)
	movement_speed = rng.randi_range(100,500)
	direction_x = rng.randi_range(-1,1)


func _process(delta: float) -> void:
	# meteor movement
	position += Vector2(direction_x,1) *movement_speed *delta
	rotation += rotation_speed * delta

func _on_body_entered(_body: Node2D) -> void:
	collision.emit()
	

func _on_area_entered(area: Area2D) -> void:
	Global.score +=5
	area.queue_free()
	queue_free()
