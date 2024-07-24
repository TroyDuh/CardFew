extends Node

#Card format: Key is name, array is stored in HP - ATK - TRIBUTE COST - ENERGY COST - ATTRIBUTES - IMG URL
var cardDB = {"Dummy": [1,0,0,1,["Revival"],load("res://Sprites/Cards/DefaultCard.png")], "Mirage": [1,0,0,0,[],load("res://Sprites/Cards/MirageToken.png")], "Blue Eyes" : [5,3,1,1, [], load("res://Sprites/Cards/TCard.png")], "Right Rabbit" : [3, 1, 0, 1, ["Right Jump"], load("res://Sprites/Cards/Rabbit.png")], "Wrong Rabbit" : [3, 1, 1, 0, ["Left Jump"], load("res://Sprites/Cards/WrongRabbit.png")], "Kuriboh" : [5, 0, 0, 1, ["Defender"], load("res://Sprites/Cards/Kuriboh.png")], "Hawk" : [2, 1, 0, 1, ["Flying"], load("res://Sprites/Cards/TCard.png")], "Ouroboros" : [2, 0, 0, 1, ["Devourer", "Sacrifice"], load("res://Sprites/Cards/TCard.png")], "DM" : [1, 1, 0, 1, ["Restock"], load("res://Sprites/Cards/TCard.png")], "Skeleton King" : [4, 2, 0, 3, ["Necromancer"], load("res://Sprites/Cards/TCard.png")]}
var defaultCardDB = {"Dummy": [1,0,1,1,["Revival"],load("res://Sprites/Cards/DefaultCard.png")], "Mirage": [1,0,0,0,[],load("res://Sprites/Cards/MirageToken.png")]}

#Temporary holding value for card images
var cardDictHolder
#Await signals for adding cards
signal resume

# Called when the node enters the scene tree for the first time.
func _ready():
	#createCards([{"name": "Roger", "health": 5, "ATK": 2, "tribute_cost": 5, "energy_cost": 2, "attribute": "right jump", "image": "https://via.placeholder.com/512"}])
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func createCards(cardList):
	for cardDict in cardList:
		cardDictHolder = cardDict
		get_parent().get_node("HTTPRequest").image_download_request(cardDict.get("image"), mergeCardData)
		await resume

func mergeCardData(texture):
	cardDB.merge({cardDictHolder.get("name"): [cardDictHolder.get("health"), cardDictHolder.get("ATK"), cardDictHolder.get("tribute_cost"), cardDictHolder.get("energy_cost"), cardDictHolder.get("attributes"), texture]})
	print(cardDB)
	resume.emit()

func clearCardDB():
	cardDB = defaultCardDB

func getCardData(cardName):
	return cardDB.get(cardName)
