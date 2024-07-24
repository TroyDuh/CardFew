extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func gameEnd(playerWon):
	if playerWon:
		$Label.text = "You Won!"
	else:
		$Label.text = "You Lost..."
	self.visible = true
	
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(1,1,1,1), 1)

func gameStart():
	self.visible = false
	self.modulate.a = 0
