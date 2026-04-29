extends Control

var level_scene: PackedScene = load("res://Scenes/level.tscn")

func _ready() -> void:
	$CenterContainer/VBoxContainer/Score.text = $CenterContainer/VBoxContainer/Score.text + str(Global.score)
	$BGMusic.play()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("start"):
		Global.score=0
		$ConfirmMusic.play()
		await get_tree().create_timer(0.2).timeout
		get_tree().change_scene_to_packed(level_scene)
