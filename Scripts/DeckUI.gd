extends Node2D

@export var cardUI: PackedScene

var cardList = []

var startX = 50
var endX = 570
var currX = startX
var xIncrement = 100

var startY = 70
var currY = startY
var yIncrement = 140

# Called when the node enters the scene tree for the first time.
func _ready():
	var deckList = ["Blue Eyes", "DM", "R-Ace", "Dummy", "Dummy", "Dummy", "Right Rabbit", "Roberto", "Wrong Rabbit", "Alligator Swordsman", "Jerry Beans Man", "Hawk", "Ouroboros", "Skeleton King", "Blue Eyes", "DM", "R-Ace", "Dummy", "Dummy", "Dummy", "Right Rabbit", "Roberto", "Wrong Rabbit", "Alligator Swordsman", "Jerry Beans Man", "Hawk", "Ouroboros", "Skeleton King", "Blue Eyes", "DM", "R-Ace", "Dummy", "Dummy", "Dummy", "Right Rabbit", "Roberto", "Wrong Rabbit", "Alligator Swordsman", "Jerry Beans Man", "Hawk", "Ouroboros", "Skeleton King"]
	#get_parent().get_parent().get_parent().get_node("DeckDB").deckContents
	for cardName in deckList:
		var cardInstance = cardUI.instantiate()
		cardInstance.cardName = cardName
		cardInstance.cardSelected.connect(cardSelected)
		cardInstance.cardInfo.connect(cardInfo)
		cardList.append(cardInstance)
		
		add_child(cardInstance)
		#searching card DB
		cardInstance.setCardStats(get_parent().get_parent().get_parent().get_parent().get_node("CardDB").getCardData(cardName))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	currX = startX
	currY = startY
	for card in cardList:
		card.position.y = currY
		card.position.x = currX
		
		#Incrementation
		currX += xIncrement
		if currX > endX:
			currX = startX
			currY += yIncrement

func cardSelected(cardNode):
	cardList.remove_at(cardList.find(cardNode))
	get_parent().get_parent().get_parent().get_parent().get_node("DeckDB").removeCard(cardNode.cardName)
	get_parent().get_parent().get_parent().get_parent().get_node("Inventory").addCards([cardNode.cardName])
	print(get_parent().get_parent().get_parent().get_parent().get_node("DeckDB").deckContents)

func cardInfo(cardNode):
	$CardInfo.cardName = cardNode.cardName
	$CardInfo.HP = cardNode.hp
	$CardInfo.ATK = cardNode.atk
	$CardInfo.tributeCost = cardNode.tributeCost
	$CardInfo.energyCost = cardNode.energyCost
	$CardInfo.attributes = cardNode.attributes
