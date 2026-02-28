extends CanvasLayer

@export var gamedata : GameData

# UI elements to display values
@onready var nomads_value_ui = $HBoxContainer/Col1_VBoxContainer/nomadsHBoxContainer/value
@onready var horses_value_ui = $HBoxContainer/Col1_VBoxContainer/horsesHBoxContainer/value
@onready var food_value_ui = $HBoxContainer/Col1_VBoxContainer/foodHBoxContainer/value
@onready var wealth_value_ui = $HBoxContainer/Col1_VBoxContainer/wealthHBoxContainer/value

@onready var global_game_tick = $globalGameTick

func _ready() -> void:
	global_game_tick.wait_time = gamedata.tick_rate
	global_game_tick.start((1/gamedata.tick_rate))

func _on_global_game_tick_timeout() -> void:
	global_game_tick.start((1/gamedata.tick_rate))
