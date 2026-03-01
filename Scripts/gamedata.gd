class_name GameData
extends Resource

@export var tick_rate: float = 1.0

@export_category("Constants")
@export var food_use_per_nomad: float = 0.2
@export var food_use_per_horse: float = 0.4
@export var minimum_local_food_available: float = 500
@export var minimum_distance_to_next_area: float = 10
@export var hunter_local_food_subtraction: float = 0.5
@export var husbandry_work_base: float = 0.1
@export var childrearing_work_base: float = 0.1
@export var hunting_work_base: float = 0.66
@export var starvation_rate: float = 0.03
@export var minimum_number_to_starve: float = 0.5

@export_category("Resources")
@export var nomad_count: float = 4
@export var horse_count: float = 0
@export var food_count: float = 100
@export var wealth_count: float = 0

@export_category("Jobs assgined")
@export var husbandry_workers: int = 0
@export var childrearing_workers: int = 0
@export var hunting_workers: int = 0
@export var pillaging_workers: int = 0

@export_category("Job rates")
@export var horse_distance_rate: float = 1
@export var husbandry_worker_rate: float = 1
@export var childrearing_worker_rate: float = 1
@export var hunting_worker_rate: float = 1
@export var pillaging_worker_rate: float = 1

@export_category("Local resource values")
@export var current_local_food_available: float = 1000
@export var distance_to_next_area: float = 10
@export var distance_remainging_to_travel: float = 0
@export var distance_multiplier: float = 1.5
@export var travelling: bool = false

@export var not_starving: int = 1
@export var game_state: int = 1 # 1 is normal, 0 is game over
