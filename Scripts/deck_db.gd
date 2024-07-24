extends Node

var deckContents = ["Blue Eyes", "DM", "R-Ace", "Dummy", "Dummy", "Dummy", "Right Rabbit", "Roberto", "Wrong Rabbit", "Alligator Swordsman", "Jerry Beans Man", "Hawk", "Ouroboros", "Skeleton King"]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func addCards(cardNames):
	for cardName in cardNames:
		deckContents.append(cardName)

func removeCard(cardName):
	deckContents.remove_at(deckContents.find(cardName))
