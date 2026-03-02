extends MarginContainer

@export var gamedata : GameData

func _ready() -> void:
	$ScrollContainer/VBoxContainer/auto_migrate/VBoxContainer/HBoxContainer/price.text = str("(",int(gamedata.auto_migrate_cost),")")
	$ScrollContainer/VBoxContainer/better_hunting/VBoxContainer/HBoxContainer/price.text = str("(",int(gamedata.hunting_improvement_cost),")")
	$ScrollContainer/VBoxContainer/better_horses/VBoxContainer/HBoxContainer/price.text = str("(",int(gamedata.horse_distance_improvement_cost),")")
	$ScrollContainer/VBoxContainer/better_pillaging/VBoxContainer/HBoxContainer/price.text = str("(",int(gamedata.pillaging_improvement_cost),")")
	$ScrollContainer/VBoxContainer/better_husbandry/VBoxContainer/HBoxContainer/price.text = str("(",int(gamedata.husbandry_improvement_cost),")")
	$ScrollContainer/VBoxContainer/better_childrearing/VBoxContainer/HBoxContainer/price.text = str("(",int(gamedata.childrearing_improvement_cost),")")

func _better_hunting_on_button_pressed() -> void:
	if gamedata.wealth_count < gamedata.hunting_improvement_cost:
		return
	$ScrollContainer/VBoxContainer/better_hunting/Button.disabled = true
	gamedata.wealth_count -= gamedata.hunting_improvement_cost
	gamedata.hunting_worker_rate += 1
	gamedata.hunting_improvement_cost = gamedata.hunting_improvement_cost * 1.2
	$ScrollContainer/VBoxContainer/better_hunting/Button.disabled = false
	$ScrollContainer/VBoxContainer/better_hunting/VBoxContainer/HBoxContainer/price.text = str("(",int(gamedata.hunting_improvement_cost),")")

func _better_horses_on_button_pressed() -> void:
	if gamedata.wealth_count < gamedata.horse_distance_improvement_cost:
		return
	$ScrollContainer/VBoxContainer/better_horses/Button.disabled = true
	gamedata.wealth_count -= gamedata.horse_distance_improvement_cost
	gamedata.horse_distance_rate += 1
	gamedata.horse_distance_improvement_cost = gamedata.horse_distance_improvement_cost * 1.2
	$ScrollContainer/VBoxContainer/better_horses/Button.disabled = false
	$ScrollContainer/VBoxContainer/better_horses/VBoxContainer/HBoxContainer/price.text = str("(",int(gamedata.horse_distance_improvement_cost),")")

func _better_pillaging_on_button_pressed() -> void:
	if gamedata.wealth_count < gamedata.pillaging_improvement_cost:
		return
	$ScrollContainer/VBoxContainer/better_pillaging/Button.disabled = true
	gamedata.wealth_count -= gamedata.pillaging_improvement_cost
	gamedata.pillaging_worker_rate += 1
	gamedata.pillaging_improvement_cost = gamedata.pillaging_improvement_cost * 1.2
	$ScrollContainer/VBoxContainer/better_pillaging/Button.disabled = false
	$ScrollContainer/VBoxContainer/better_pillaging/VBoxContainer/HBoxContainer/price.text = str("(",int(gamedata.pillaging_improvement_cost),")")

func _better_husbandry_on_button_pressed() -> void:
	if gamedata.wealth_count < gamedata.husbandry_improvement_cost:
		return
	$ScrollContainer/VBoxContainer/better_husbandry/Button.disabled = true
	gamedata.wealth_count -= gamedata.husbandry_improvement_cost
	gamedata.husbandry_worker_rate += 1
	gamedata.husbandry_improvement_cost = gamedata.husbandry_improvement_cost * 1.2
	$ScrollContainer/VBoxContainer/better_husbandry/Button.disabled = false
	$ScrollContainer/VBoxContainer/better_husbandry/VBoxContainer/HBoxContainer/price.text = str("(",int(gamedata.husbandry_improvement_cost),")")

func _better_childrearing_on_button_pressed() -> void:
	if gamedata.wealth_count < gamedata.childrearing_improvement_cost:
		return
	$ScrollContainer/VBoxContainer/better_childrearing/Button.disabled = true
	gamedata.wealth_count -= gamedata.childrearing_improvement_cost
	gamedata.childrearing_worker_rate += 1
	gamedata.childrearing_improvement_cost = gamedata.childrearing_improvement_cost * 1.2
	$ScrollContainer/VBoxContainer/better_childrearing/Button.disabled = false
	$ScrollContainer/VBoxContainer/better_childrearing/VBoxContainer/HBoxContainer/price.text = str("(",int(gamedata.childrearing_improvement_cost),")")

func _auto_migrate_on_button_pressed() -> void:
	if gamedata.wealth_count < gamedata.auto_migrate_cost:
		return
	$ScrollContainer/VBoxContainer/auto_migrate/Button.disabled = true
	gamedata.wealth_count -= gamedata.auto_migrate_cost
	gamedata.auto_migrate = 1
	$ScrollContainer/VBoxContainer/auto_migrate.queue_free()
