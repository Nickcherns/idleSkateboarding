extends Resource

class_name TrickSelector

#var idle: String = "idleSkate"
#var kickflip: String = "flipTowards"
#var heelflip: String = "flipAway"
#var manual: String = "manualFull"
#var nollie_kickflip: String = "flipTowards"
#var nollie_heelflip: String = "flipAway"
#var nose_manual: String = "manualFull"

# set trick list and animation list
#    with functions to return proper animations
var trick_list = [
	"ollie",
	"kickflip",
	"heelflip",
	"nollie_kickflip",
	"nollie_heelflip",
	"manual",
	"nose_manual",
	"tre_flip",
	"nollie_treflip"
]

var animation_list = {
	"ollie" : "ollie",
	"kickflip" : "flipAway",
	"heelflip" : "flipTowards",
	"nollie_kickflip" : "flipAway", 
	"nollie_heelflip" : "flipTowards",
	"manual" : "manualFull",
	"nose_manual" : "manualFull",
	"tre_flip" : "treFlip",
	"nollie_treflip" : "treFlip"
}

# return random trick from array
func selectRandom() -> String :
	var rand: String
	var rand_num = randi() % len(trick_list)
	rand = trick_list[rand_num]
	return rand
	
# search dictionary and return proper animation string
func returnAnimation(word) -> String :
	print(word)
	return animation_list.get(word)

