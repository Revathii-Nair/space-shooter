extends CanvasLayer

static var image = load('res://Graphics/UI/playerLife1_blue.png')

func set_health(amount):
	# remove all children
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	
	# create new children amount set by health
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP
		$MarginContainer2/HBoxContainer.add_child(text_rect)
		
func _on_score_timer_timeout() -> void:
	Global.score += 1
	$MarginContainer/Score.text = str(Global.score)
