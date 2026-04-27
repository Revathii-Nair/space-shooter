extends Area2D

@export var speed:=800

func _ready():
	# changing the scale(size) of the laser
	$LaserImage.scale = Vector2(0,0)
	var tween = create_tween()
	tween.tween_property($LaserImage,"scale",Vector2(1,1),0.2)

func _process(delta: float) -> void:
	# laser movement
	position += Vector2(0,-1) * speed * delta
	pass
