extends Resource

class_name TrickItem

var PointSystem : IncrementalSystem = preload("res://resources/PointSystem.tres")
var trick_selector : TrickSelector = preload("res://resources/TrickSelect.tres")

@export var name: String
@export var description: String
@export var cost: int
@export var trick_value: int
@export var locked: bool
@export var flip_trick: bool
@export var nollie_flip_trick: bool

var tricks: Array = [
	"Ollie",
	"Kickflip",
	"Heelflip",
	"Manual",
	"360 Flip",
	"Nose Manual",
	"Nollie Kickflip",
	"Nollie Heelflip",
	"Nollie 360 Flip",
]

var trick_func: Array = [
	"add_ollie",
	"add_kickflip",
	"add_heelflip",
	"add_manual",
	"add_360_flip",
	"add_nose_manual",
	"add_nollie_kickflip",
	"add_nollie_heelflip",
	"add_nollie_360_flip",
]

func unlock_trick() -> void:
	if locked == true:
		locked = false

func cost_check() -> bool:
	if cost > PointSystem.active_value:
		return false
	else:
		return true

func trick_trained() -> void:
	PointSystem.add_to_trick(cost, trick_value)
	for i in range(len(tricks)):
		if tricks[i] == name:
			trick_selector.call(trick_func[i])
