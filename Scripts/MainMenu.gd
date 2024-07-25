extends Control

var prizePool = []

signal enemyDeckFinished

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func Enter():
	$Play.disabled = false
	$Deck.disabled = false

func Exit():
	pass

func _on_deck_pressed():
	get_parent().switchScene(self, get_parent().get_node("DeckBuild"))


func _on_play_pressed():
	$Play.disabled = true
	$Deck.disabled = true
	if prizePool.is_empty():
		print("Loading...")
		get_parent().get_node("HTTPRequest").make_post_request(5, enemyDeckGenerated, null)
	else:
		get_parent().switchScene(self, get_parent().get_node("Game"))
		
	await enemyDeckFinished
	if prizePool.is_empty():
		#Creating prize cards
		print("Generating prize cards...")
		get_parent().get_node("HTTPRequest").make_post_request(3, createPool, null)

func enemyDeckGenerated(cardList: Array):
	print("Enemy Cards Generated:")
	print(cardList)
	
	get_parent().get_node("CardDB").createCards(cardList.duplicate())
	for X in cardList.size():
		get_parent().get_node("Game").get_node("EnemyDeck").addToEnemyDeck([cardList[X].get("name")])
	get_parent().switchScene(self, get_parent().get_node("Game"))
	enemyDeckFinished.emit()

func createPool(cardList:Array):
	print("Prize Cards Generated:")
	print(cardList)
	
	get_parent().get_node("CardDB").createCards(cardList.duplicate())
	for X in cardList.size():
		prizePool.append(cardList[X].get("name"))
	
	#Triggering second round of enemy card generation
	get_parent().get_node("HTTPRequest").make_post_request(5, enemyDeckGenerated, null)
	#Queueing next deck to ensure seamlessness
	await enemyDeckFinished
	get_parent().get_node("HTTPRequest").make_post_request(12, queuedDeckGenerated, null)

func queuedDeckGenerated(cardList: Array):
	print("Queued Cards Generated:")
	print(cardList)
	
	get_parent().get_node("CardDB").createCards(cardList.duplicate())
	for X in cardList.size():
		get_parent().get_node("Game").get_node("EnemyDeck").queueEnemyCards([cardList[X].get("name")])
