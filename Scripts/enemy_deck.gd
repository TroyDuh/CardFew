extends Node

#card tracking
var deckContents = []

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	deckContents = ["Blue Eyes", "Blue Eyes", "Blue Eyes", "DM", "R-Ace", "Dummy", "Dummy", "Dummy", "Dummy", "Right Rabbit", "Roberto", "Wrong Rabbit", "Alligator Swordsman", "Jerry Beans Man", "Kuriboh", "Hawk", "Ouroboros", "Skeleton King"]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func draw(cardCount):
	var cardsDrawn = []
	for x in cardCount:
		if !deckContents.is_empty():
			var cardDrawn = rng.randf_range(0, deckContents.size())
			cardsDrawn.append(deckContents[cardDrawn])
			deckContents.remove_at(cardDrawn)
		else:
			print("deck out bruv")
	get_parent().get_node("EnemyHand").addCards(cardsDrawn)

func add(cardName):
	deckContents.append(cardName)

