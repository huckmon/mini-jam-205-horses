extends VBoxContainer

@export var gamedata : GameData

# value ui elements
@onready var husbandry_value = $HusbandryJobVBoxContainer/HBoxContainer/value
@onready var childrearing_value = $childrearingJobVBoxContainer/HBoxContainer/value
@onready var hunting_value = $huntingJobVBoxContainer/HBoxContainer/value
@onready var pillaging_value = $pillagingJobVBoxContainer/HBoxContainer/value

var total_jobs: float

func _ready() -> void:
	$pillagingJobVBoxContainer.visible = false

func _physics_process(_delta: float) -> void:
	update_values()
	
func update_values():
	husbandry_value.text = str(gamedata.husbandry_workers)
	childrearing_value.text = str(gamedata.childrearing_workers)
	hunting_value.text = str(gamedata.hunting_workers)
	pillaging_value.text = str(gamedata.pillaging_workers)

func _on_global_game_tick_timeout() -> void:
	gamedata.nomad_count += gamedata.not_starving * (float(gamedata.childrearing_workers) * (gamedata.childrearing_work_base * gamedata.hunting_worker_rate))
	gamedata.horse_count += gamedata.not_starving * (float(gamedata.husbandry_workers) * (gamedata.husbandry_work_base * gamedata.hunting_worker_rate))
	if gamedata.current_local_food_available > 0 and not gamedata.travelling:
		gamedata.food_count += float(gamedata.hunting_workers) * (gamedata.hunting_work_base * gamedata.hunting_worker_rate)
		gamedata.current_local_food_available -= (float(gamedata.hunting_workers) * (gamedata.hunting_work_base))
	if gamedata.food_count < 0:
		gamedata.food_count = 0

func get_total_job_count(a: int = 0):
	total_jobs = float(gamedata.husbandry_workers + gamedata.childrearing_workers + gamedata.hunting_workers + gamedata.pillaging_workers + a)
	return total_jobs

func _on_col_1_v_box_container_first_time_10_horses() -> void:
	$pillagingJobVBoxContainer.visible = true

#region Husbandry button signals
func _husbandry_on_neg_10_pressed() -> void:
	if floorf(gamedata.husbandry_workers) <= 9.0:
		pass
	else:
		gamedata.husbandry_workers -= 10

func _husbandry_on_neg_1_pressed() -> void:
	if floorf(gamedata.husbandry_workers) <= 0:
		pass
	else:
		gamedata.husbandry_workers -= 1

func _husbandry_on_pos_1_pressed() -> void:
	if floorf(gamedata.nomad_count) <= get_total_job_count():
		pass
	else:
		gamedata.husbandry_workers += 1

func _husbandry_on_pos_10_pressed() -> void:
	if floorf(gamedata.nomad_count) <= get_total_job_count(10):
		pass
	else:
		gamedata.husbandry_workers += 10
#endregion

#region Childrearing button signals
func _childrearing_on_neg_10_pressed() -> void:
	if floorf(gamedata.childrearing_workers) <= 9.0:
		pass
	else:
		gamedata.childrearing_workers -= 10

func _childrearing_on_neg_1_pressed() -> void:
	if floorf(gamedata.childrearing_workers) <= 0:
		pass
	else:
		gamedata.childrearing_workers -= 1

func _childrearing_on_pos_1_pressed() -> void:
	if floorf(gamedata.nomad_count) <= get_total_job_count():
		pass
	else:
		gamedata.childrearing_workers += 1

func _childrearing_on_pos_10_pressed() -> void:
	if floorf(gamedata.nomad_count) <= get_total_job_count(10):
		pass
	else:
		gamedata.childrearing_workers += 10
#endregion

#region Hunting button signals
func _hunting_on_neg_10_pressed() -> void:
	if floorf(gamedata.hunting_workers) <= 9.0:
		pass
	else:
		gamedata.hunting_workers -= 10

func _hunting_on_neg_1_pressed() -> void:
	if floorf(gamedata.hunting_workers) <= 0:
		pass
	else:
		gamedata.hunting_workers -= 1

func _hunting_on_pos_1_pressed() -> void:
	if floorf(gamedata.nomad_count) <= get_total_job_count():
		pass
	else:
		gamedata.hunting_workers += 1

func _hunting_on_pos_10_pressed() -> void:
	if floorf(gamedata.nomad_count) <= get_total_job_count(10):
		pass
	else:
		gamedata.hunting_workers += 10
#endregion

#region Pillaging button signals
func _pillaging_on_neg_10_pressed() -> void:
	if floorf(gamedata.pillaging_workers) <= 9.0:
		pass
	else:
		gamedata.pillaging_workers -= 10

func _pillaging_on_neg_1_pressed() -> void:
	if floorf(gamedata.pillaging_workers) <= 0:
		pass
	else:
		gamedata.pillaging_workers -= 1

func _pillaging_on_pos_1_pressed() -> void:
	if floorf(gamedata.nomad_count) <= get_total_job_count():
		pass
	else:
		gamedata.pillaging_workers += 1

func _pillaging_on_pos_10_pressed() -> void:
	if floorf(gamedata.nomad_count) <= get_total_job_count(10):
		pass
	else:
		gamedata.pillaging_workers += 10
#endregion

# not yet implemented, but planned
# NOTE replace the sections
#region Culling button signals
func _culling_on_neg_10_pressed() -> void:
	if floorf(gamedata.culling_workers) <= 9.0:
		pass
	else:
		gamedata.culling_workers -= 10

func _culling_on_neg_1_pressed() -> void:
	if floorf(gamedata.culling_workers) <= 0:
		pass
	else:
		gamedata.culling_workers -= 1

func _culling_on_pos_1_pressed() -> void:
	if floorf(gamedata.nomad_count) <= get_total_job_count():
		pass
	else:
		gamedata.culling_workers += 1

func _culling_on_pos_10_pressed() -> void:
	if floorf(gamedata.nomad_count) <= get_total_job_count(10):
		pass
	else:
		gamedata.culling_workers += 10
#endregion
