extends Resource

class_name TrickSelector

# set trick list and animation list
#    trick list holds will hold each trick
#    animation_list matches the trick name (key) with 
#      the appropriate animation string (value)
var trick_list: Array = []
var animation_list: Dictionary = {}

# functions to add tricks/animations to the trick_list/animation_list
#   functions are used to 'unlock' tricks when trained
func add_ollie() -> void:
	trick_list.append("ollie")
	animation_list["ollie"] = "ollie"

func add_kickflip() -> void:
	trick_list.append("kickflip")
	animation_list["kickflip"] = "flipAway"

func add_heelflip() -> void:
	trick_list.append("heelflip")
	animation_list["heelflip"] = "flipTowards"

func add_manual() -> void:
	trick_list.append("manual")
	animation_list["manual"] = "manualFull"

func add_360_flip() -> void:
	trick_list.append("360_flip")
	animation_list["360_flip"] = "360_flip"

func add_nollie_kickflip() -> void:
	trick_list.append("nollie_kickflip")
	animation_list["nollie_kickflip"] = "flipAway"

func add_nollie_heelflip() -> void:
	trick_list.append("nollie_heelflip")
	animation_list["nollie_heelflip"] = "flipTowards"

func add_nose_manual() -> void:
	trick_list.append("nose_manual")
	animation_list["nose_manual"] = "manualFull"

func add_nollie_360_flip() -> void:
	trick_list.append("nollie_360_flip")
	animation_list["nollie_360_flip"] = "360_flip"


# return random trick from array
func selectRandom():
	var rand: String
	if len(trick_list) > 0:
		var rand_num = randi() % len(trick_list)
		rand = trick_list[rand_num]
		return rand

	
# search dictionary and return proper animation string
func returnAnimation(word) -> String :
	return animation_list.get(word)

