extends VBoxContainer

@export var gamedata : GameData

# value ui elements of resources
@onready var nomad_count = $nomadsHBoxContainer/value
@onready var horse_count = $horsesHBoxContainer/value
@onready var food_count = $foodHBoxContainer/value
@onready var wealth_count = $wealthHBoxContainer/value

# value ui elements for local areas and travelling
@onready var local_food_count = $availablefoodHBoxContainer/value
@onready var distance_to_travel_ui = $distancetotravelHBoxContainer/value
@onready var distance_remaining_to_travel_ui = $distanceremainingHBoxContainer/value

@onready var migrate_button = $migrateLabel/migrateButton

var tick_count: int = 0

func _ready() -> void:
	# things to disable at start
	$distanceremainingHBoxContainer.visible = false
	$timeleftHBoxContainer.visible = false
	$starving.visible = false

func _physics_process(_delta: float) -> void:
	update_values()
	if not gamedata.travelling:
		return
	
	
func update_values() -> void:
	nomad_count.text = str(int(floorf(gamedata.nomad_count)))
	horse_count.text = str(int(floorf(gamedata.horse_count)))
	food_count.text = str(int(floorf(gamedata.food_count)))
	wealth_count.text = str(int(floorf(gamedata.wealth_count)))
	local_food_count.text = str(int(floorf(gamedata.current_local_food_available)))
	distance_to_travel_ui.text = str(snapped(gamedata.distance_to_next_area, 0.01))
	if gamedata.travelling:
		distance_remaining_to_travel_ui.text = str(snapped(gamedata.distance_remainging_to_travel, 1))

func _on_global_game_tick_timeout() -> void:
	gamedata.food_count -= (gamedata.nomad_count * gamedata.food_use_per_nomad) + (gamedata.horse_count * gamedata.food_use_per_horse)
	if not gamedata.travelling and tick_count >= (randi_range(2, 6)):
		generate_distance_to_travel()
	else:
		tick_count += 1
	if gamedata.travelling:
		travelling()
	if gamedata.food_count <= 0:
		starvation()
	elif gamedata.not_starving == 0:
		gamedata.not_starving = 1
		$starving.visible = false

func starvation():
	# NOTE: Add starving notification
	$starving.visible = true
	gamedata.not_starving = 0
	if gamedata.horse_count > 0:
		print(maxf(gamedata.minimum_number_to_starve, (gamedata.horse_count * gamedata.starvation_rate))," horses starved")
		gamedata.horse_count -= maxf(gamedata.minimum_number_to_starve, (gamedata.horse_count * gamedata.starvation_rate))
	if gamedata.nomad_count > 0:
		print(maxf(gamedata.minimum_number_to_starve, gamedata.nomad_count * gamedata.starvation_rate)," nomads starved")
		gamedata.nomad_count -= maxf(gamedata.minimum_number_to_starve, gamedata.nomad_count * gamedata.starvation_rate)
	if gamedata.nomad_count < float(gamedata.husbandry_workers + gamedata.childrearing_workers + gamedata.hunting_workers + gamedata.pillaging_workers):
		remove_jobs()
	if gamedata.nomad_count < 1:
		gamedata.game_state = 0
		
func remove_jobs():
	while gamedata.nomad_count < float(gamedata.husbandry_workers + gamedata.childrearing_workers + gamedata.hunting_workers + gamedata.pillaging_workers):
		if gamedata.husbandry_workers > 0:
			gamedata.husbandry_workers -= 1
		elif gamedata.pillaging_workers > 0:
			gamedata.pillaging_workers -= 1
		elif gamedata.childrearing_workers > 0:
			gamedata.childrearing_workers -= 1
		elif gamedata.hunting_workers > 0:
			gamedata.hunting_workers -= 1
		else:
			print("game over")
			break

func generate_distance_to_travel():
	gamedata.distance_to_next_area = randi_range(int(gamedata.minimum_distance_to_next_area), int(gamedata.minimum_distance_to_next_area * (gamedata.distance_multiplier)))

func travelling():
	gamedata.distance_remainging_to_travel -= gamedata.base_travel_distance + (gamedata.horse_count * gamedata.horse_distance_rate) / ((gamedata.nomad_count/2)+ (gamedata.food_count/8))
	if gamedata.distance_remainging_to_travel <= 0:
		gamedata.travelling = false
		migrate_button.disabled = false
		$availablefoodHBoxContainer.visible = true
		$distanceremainingHBoxContainer.visible = false
		$distancetotravelHBoxContainer.visible = true
		generate_local()

func generate_local():
	gamedata.current_local_food_available = randf_range(gamedata.minimum_local_food_available, ((1 + ((gamedata.nomad_count + gamedata.horse_count) * 0.01)) * gamedata.minimum_local_food_available))

func _on_migrate_button_pressed() -> void:
	if gamedata.travelling:
		return
	print("starting travelling")
	migrate_button.disabled = true
	$availablefoodHBoxContainer.visible = false
	$distanceremainingHBoxContainer.visible = true
	$distancetotravelHBoxContainer.visible = false
	gamedata.distance_remainging_to_travel = gamedata.distance_to_next_area
	gamedata.travelling = true
