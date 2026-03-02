extends VBoxContainer

@export var gamedata : GameData

@onready var pillagers_waiting_ui = $pillagers_waiting
@onready var pillagers_out_ui = $pillagers_out

@onready var pillage_timer = $pillage/pillage_timer
@onready var waiting_ui = $waitingHBoxContainer

var waiting_count: int = 3

@onready var waiting_array: Array = [$waitingHBoxContainer/dot0, $waitingHBoxContainer/dot1, $waitingHBoxContainer/dot2]

func _ready() -> void:
	$pillagers_out.visible = false
	waiting_ui.visible = false
	self.visible = false

func _on_global_game_tick_timeout() -> void:
	update_values()

func update_values():
	gamedata.ready_pillagers = int(min(gamedata.pillaging_workers, gamedata.pillaging_workers*(gamedata.horse_count/gamedata.pillaging_workers)))
	$pillagers_waiting/waiting_value.text = str(gamedata.pillaging_workers,"(",gamedata.ready_pillagers,")")

func _on_pillage_button_pressed() -> void:
	if gamedata.pillagers_out:
		return
	if gamedata.pillaging_workers < 1:
		return
	gamedata.sent_pillagers = gamedata.ready_pillagers
	$pillagers_out/out_value.text = str(gamedata.sent_pillagers)
	pillagers_out_ui.visible = true
	pillagers_waiting_ui.visible = false
	waiting_ui.visible = true
	$waitingHBoxContainer/waiting_timer.start()
	pillage_timer.start(gamedata.base_pillage_time / gamedata.pillaging_travel_rate)

func _on_pillage_timer_timeout() -> void:
	gamedata.pillagers_out = false
	pillagers_out_ui.visible = false
	pillagers_waiting_ui.visible = true
	waiting_ui.visible = false
	$waitingHBoxContainer/waiting_timer.stop()
	#gamedata.wealth_count += randf_range(gamedata.minimum_pillage_earning, ((gamedata.minimum_pillage_earning * gamedata.sent_pillagers) * gamedata.pillaging_worker_rate))
	gamedata.wealth_count += pow(1.1, gamedata.pillaging_worker_rate) * (gamedata.minimum_pillage_earning * gamedata.sent_pillagers)

func _on_waiting_timer_timeout() -> void:
	$waitingHBoxContainer/waiting_timer.start()
	if waiting_count < 3:
		waiting_array[waiting_count].visible = true
		waiting_count += 1
		return
	waiting_array[0].visible = false
	waiting_array[1].visible = false
	waiting_array[2].visible = false
	waiting_count = 0
