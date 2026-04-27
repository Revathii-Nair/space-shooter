extends Control

var level_scene: PackedScene = load("res://Scenes/level.tscn")

func _ready() -> void:
	$CenterContainer/VBoxContainer/Score.text = $CenterContainer/VBoxContainer/Score.text + str(Global.score)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("start"):
		get_tree().change_scene_to_packed(level_scene)
