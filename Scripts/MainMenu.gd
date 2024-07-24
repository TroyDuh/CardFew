extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func Enter():
	pass

func Exit():
	pass

func _on_deck_pressed():
	get_parent().switchScene(self, get_parent().get_node("DeckBuild"))


func _on_play_pressed():
	get_parent().switchScene(self, get_parent().get_node("Game"))
