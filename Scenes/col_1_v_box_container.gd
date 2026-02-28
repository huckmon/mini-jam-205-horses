extends VBoxContainer

@export var gamedata : GameData

# value ui elements
@onready var nomad_count = $nomadsHBoxContainer/value
@onready var horse_count = $horsesHBoxContainer/value
@onready var food_count = $foodHBoxContainer/value
@onready var wealth_count = $wealthHBoxContainer/value

func _physics_process(_delta: float) -> void:
	update_values()
	
func update_values():
	nomad_count.text = str(gamedata.nomad_count)
	horse_count.text = str(gamedata.horse_count)
	food_count.text = str(gamedata.food_count)
	wealth_count.text = str(gamedata.wealth_count)
