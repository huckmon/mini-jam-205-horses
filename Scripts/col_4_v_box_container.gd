extends VBoxContainer

@export var gamedata : GameData

func _on_restart_button_pressed() -> void:
	gamedata.reset_state()
	get_tree().reload_current_scene()
