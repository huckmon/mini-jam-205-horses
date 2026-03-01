extends CanvasLayer

@export var gamedata : GameData

# UI elements to display values
#@onready var nomads_value_ui = $HBoxContainer/Col1_VBoxContainer/nomadsHBoxContainer/value
#@onready var horses_value_ui = $HBoxContainer/Col1_VBoxContainer/horsesHBoxContainer/value
#@onready var food_value_ui = $HBoxContainer/Col1_VBoxContainer/foodHBoxContainer/value
#@onready var wealth_value_ui = $HBoxContainer/Col1_VBoxContainer/wealthHBoxContainer/value

@onready var global_game_tick = $globalGameTick
@onready var game_over_col = $HBoxContainer/col_4_VBoxContainer
@onready var info_screen = $infoScreen

func _ready() -> void:
	global_game_tick.wait_time = gamedata.tick_rate
	global_game_tick.start((1/gamedata.tick_rate))
	game_over_col.visible = false
	info_screen.visible = false
	

func _on_global_game_tick_timeout() -> void:
	global_game_tick.start((1/gamedata.tick_rate))
	if gamedata.game_state == 0:
		game_over_col.visible = true
		global_game_tick.stop()

func _on_info_button_pressed() -> void:
	info_screen.visible = true

func _on_col_1_v_box_container_first_time_10_horses() -> void:
	$HBoxContainer/col_3_VBoxContainer.visible = true
