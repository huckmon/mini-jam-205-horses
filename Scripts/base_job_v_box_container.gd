extends VBoxContainer

@export var gamedata : GameData

var total_jobs: float

var current_jobs: float

# NOTE: try defining the workers within a class or something similar to achieve the dynamic component based solution I'm looking for
# Otherwise call methods 

func get_total_job_count(a: int = 0):
	total_jobs = float(gamedata.husbandry_workers + gamedata.childrearing_workers + gamedata.hunting_workers + gamedata.pillaging_workers + a)
	return total_jobs

func _ready() -> void:
	print(str(self.get_groups()[0]))

func _on_neg_all_pressed() -> void:
	# need to return this to
	get_tree().call_group(str(self.get_groups()[0]), "set", 0)
	pass

func _on_neg_10_pressed() -> void:
	if floorf(gamedata.husbandry_workers) <= 9:
		pass
	else:
		#gamedata.husbandry_workers -= 10
		get_tree().call_group(str(self.get_groups()[0]), "sub", 10)

func _on_neg_1_pressed() -> void:
	if floorf(gamedata.husbandry_workers) <= 0:
		pass
	else:
		#gamedata.husbandry_workers -= 1
		get_tree().call_group(str(self.get_groups()[0]), "sub", 1)

func _on_pos_1_pressed() -> void:
	if floorf(gamedata.nomad_count) <= get_total_job_count():
		pass
	else:
		gamedata.husbandry_workers += 1
		get_tree().call_group(str(self.get_groups()[0]), "add", 1)

func _on_pos_10_pressed() -> void:
	if floorf(gamedata.nomad_count) <= get_total_job_count(10):
		pass
	else:
		#gamedata.husbandry_workers += 10
		get_tree().call_group(str(self.get_groups()[0]), "add", 10)

func _on_pos_all_pressed() -> void:
	get_tree().call_group(str(self.get_groups()[0]), "add", ) # add all possible
