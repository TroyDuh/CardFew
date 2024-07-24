extends Node

#Card format: Key is name, array is stored in HP - ATK - TRIBUTE COST - ENERGY COST - ATTRIBUTES - IMG URL
var cardDB = {"Dummy": [1,0,0,1,["Revival"],"res://Sprites/Cards/DefaultCard.png"], "Mirage": [1,0,0,0,[],"res://Sprites/Cards/MirageToken.png"], "Blue Eyes" : [5,3,1,1, [], "res://Sprites/Cards/TCard.png"], "Right Rabbit" : [3, 1, 0, 1, ["Right Jump"], "res://Sprites/Cards/Rabbit.png"], "Wrong Rabbit" : [3, 1, 1, 0, ["Left Jump"], "res://Sprites/Cards/WrongRabbit.png"], "Kuriboh" : [5, 0, 0, 1, ["Defender"], "res://Sprites/Cards/Kuriboh.png"], "Hawk" : [2, 1, 0, 1, ["Flying"], "res://Sprites/Cards/TCard.png"], "Ouroboros" : [2, 0, 0, 1, ["Devourer", "Sacrifice"], "res://Sprites/Cards/TCard.png"], "DM" : [1, 1, 0, 1, ["Restock"], "res://Sprites/Cards/TCard.png"], "Skeleton King" : [4, 2, 0, 3, ["Necromancer"], "res://Sprites/Cards/TCard.png"]}
var defaultCardDB = {"Dummy": [1,0,1,1,["Revival"],"res://Sprites/Cards/DefaultCard.png"], "Mirage": [1,0,0,0,[],"res://Sprites/Cards/MirageToken.png"]}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func createCard(cardName, HP, ATK, TRIBUTECOST, ENERGYCOST, ATTRIBUTES, IMG):
	cardDB.merge({cardName: [HP, ATK, TRIBUTECOST, ENERGYCOST, ATTRIBUTES, IMG]})

func clearCardDB():
	cardDB = defaultCardDB

func getCardData(cardName):
	return cardDB.get(cardName)
