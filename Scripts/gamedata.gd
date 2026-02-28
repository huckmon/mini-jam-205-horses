class_name GameData
extends Resource

@export_category("Constants")
@export var food_use_per_nomad: float = 0.2
@export var foor_use_per_horse: float = 0.4

@export_category("Resources")
@export var nomad_count: float = 5
@export var horse_count: float = 0
@export var food_count: float = 50
@export var wealth_count: float = 0

@export_category("Jobs Assgined")
@export var husbandry_workers: int = 0
@export var childrearing_workers: int = 0
@export var hunting_workers: int = 0
@export var pillaging_workers: int = 0

@export_category("Job rates")
@export var husbandry_worker_rate: float = 1
@export var childrearing_worker_rate: float = 1
@export var hunting_worker_rate: float = 1
@export var pillaging_worker_rate: float = 1

@export var tick_rate: float = 1.0
