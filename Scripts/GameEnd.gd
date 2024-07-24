extends Control

var playerWon

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func gameEnd(playerVictory):
	playerWon = playerVictory
	if playerVictory:
		$Label.text = "You Won!"
		$Next.text = "Continue"
	else:
		$Label.text = "You Lost..."
		$Next.text = "Retry"
	self.visible = true
	
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate", Color(1,1,1,1), 1)

func gameStart():
	self.visible = false
	self.modulate.a = 0


func _on_next_pressed():
	if !playerWon:
		get_parent().Enter()
	else:
		pass
