extends VBoxContainer

@export var gamedata : GameData

# value ui elements
@onready var husbandry_value = $husbandryHBoxContainerComponent/value
@onready var childrearing_value = $childrearingHBoxContainerComponent/value
@onready var hunting_value = $huntingHBoxContainerComponent/value
@onready var pillaging_value = $pillagingHBoxContainerComponent/value

func _physics_process(_delta: float) -> void:
	update_values()
	
func update_values():
	husbandry_value.text = str(gamedata.husbandry_workers)
	childrearing_value.text = str(gamedata.childrearing_workers)
	hunting_value.text = str(gamedata.hunting_workers)
	pillaging_value.text = str(gamedata.pillaging_workers)

func _on_global_game_tick_timeout() -> void:
	gamedata.nomad_count += (float(gamedata.childrearing_workers) * (0.1 * gamedata.hunting_worker_rate))
	gamedata.horse_count += (float(gamedata.husbandry_workers) * (0.1 * gamedata.hunting_worker_rate))
	gamedata.food_count += (float(gamedata.hunting_workers) * (0.5 * gamedata.hunting_worker_rate))

#region Husbandry button signals
func _husbandry_on_neg_10_pressed() -> void:
	if gamedata.husbandry_workers <= 9.0:
		pass
	else:
		gamedata.husbandry_workers -= 10

func _husbandry_on_neg_1_pressed() -> void:
	if gamedata.husbandry_workers <= 0:
		pass
	else:
		gamedata.husbandry_workers -= 1

func _husbandry_on_pos_1_pressed() -> void:
	if gamedata.nomad_count <= float(gamedata.husbandry_workers + gamedata.childrearing_workers + gamedata.hunting_workers + gamedata.pillaging_workers):
		pass
	else:
		gamedata.husbandry_workers += 1

func _husbandry_on_pos_10_pressed() -> void:
	if gamedata.nomad_count <= (float(gamedata.husbandry_workers + gamedata.childrearing_workers + gamedata.hunting_workers + gamedata.pillaging_workers) + 10):
		pass
	else:
		gamedata.husbandry_workers += 10
#endregion

#region Childrearing button signals
func _childrearing_on_neg_10_pressed() -> void:
	if gamedata.childrearing_workers <= 9.0:
		pass
	else:
		gamedata.childrearing_workers -= 10

func _childrearing_on_neg_1_pressed() -> void:
	if gamedata.childrearing_workers <= 0:
		pass
	else:
		gamedata.childrearing_workers -= 1

func _childrearing_on_pos_1_pressed() -> void:
	if gamedata.nomad_count <= float(gamedata.husbandry_workers + gamedata.childrearing_workers + gamedata.hunting_workers + gamedata.pillaging_workers):
		pass
	else:
		gamedata.childrearing_workers += 1

func _childrearing_on_pos_10_pressed() -> void:
	if gamedata.nomad_count <= (float(gamedata.husbandry_workers + gamedata.childrearing_workers + gamedata.hunting_workers + gamedata.pillaging_workers) + 10):
		pass
	else:
		gamedata.childrearing_workers += 10
#endregion

#region Hunting button signals
func _hunting_on_neg_10_pressed() -> void:
	if gamedata.hunting_workers <= 9.0:
		pass
	else:
		gamedata.hunting_workers -= 10

func _hunting_on_neg_1_pressed() -> void:
	if gamedata.hunting_workers <= 0:
		pass
	else:
		gamedata.hunting_workers -= 1

func _hunting_on_pos_1_pressed() -> void:
	if gamedata.nomad_count <= float(gamedata.husbandry_workers + gamedata.childrearing_workers + gamedata.hunting_workers + gamedata.pillaging_workers):
		pass
	else:
		gamedata.hunting_workers += 1

func _hunting_on_pos_10_pressed() -> void:
	if gamedata.nomad_count <= (float(gamedata.husbandry_workers + gamedata.childrearing_workers + gamedata.hunting_workers + gamedata.pillaging_workers) + 10):
		pass
	else:
		gamedata.hunting_workers += 10
#endregion

#region Pillaging button signals
func _pillaging_on_neg_10_pressed() -> void:
	if gamedata.pillaging_workers <= 9.0:
		pass
	else:
		gamedata.pillaging_workers -= 10

func _pillaging_on_neg_1_pressed() -> void:
	if gamedata.pillaging_workers <= 0:
		pass
	else:
		gamedata.pillaging_workers -= 1

func _pillaging_on_pos_1_pressed() -> void:
	if gamedata.nomad_count <= float(gamedata.husbandry_workers + gamedata.childrearing_workers + gamedata.hunting_workers + gamedata.pillaging_workers):
		pass
	else:
		gamedata.pillaging_workers += 1

func _pillaging_on_pos_10_pressed() -> void:
	if gamedata.nomad_count <= (float(gamedata.husbandry_workers + gamedata.childrearing_workers + gamedata.hunting_workers + gamedata.pillaging_workers) + 10):
		pass
	else:
		gamedata.pillaging_workers += 10
#endregion
