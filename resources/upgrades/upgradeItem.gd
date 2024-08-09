extends Resource

class_name UpgradeItem

var PointSystem : IncrementalSystem = preload("res://resources/PointSystem.tres")

@export var name: String
@export var description: String
@export var cost: int
@export var upgrade_type: String
@export var upgrade_value: int


func cost_check() -> bool:
	if cost > PointSystem.active_value:
		return false
	else:
		return true


func handle_training():
	if upgrade_type == "add_style":
		PointSystem.add_to_style(cost, upgrade_value)
	elif upgrade_type == "multi_style":
		PointSystem.multi_style(cost, upgrade_value)
	elif upgrade_type == "click":
		PointSystem.multi_click(cost, upgrade_value)
	elif upgrade_type == "unlock_flip":
		PointSystem.unlock_flip_tricks()
	elif upgrade_type == "unlock_nollie_flip":
		PointSystem.unlock_nollie_flip_tricks()
	elif upgrade_type == "trick":
		PointSystem.multi_trick(cost, upgrade_value)
	elif upgrade_type == "double":
		PointSystem.upgrade_double(cost, upgrade_value)
	else:
		push_error("Invalid Upgrade Type")
