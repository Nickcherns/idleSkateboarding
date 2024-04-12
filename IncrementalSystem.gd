extends Resource

class_name IncrementalSystem
	
@export var active_value: int = 0
@export var click_value: int = 1
@export var trick_value: int = 0   #idle value
@export var style_points: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	active_value = calculate()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# add click_value to active_value (each click)
func click():
	print("clicked")
	active_value += click_value
	
# return all current values
func return_values() -> Dictionary:
	return {
			active_value = active_value,
			click_value = click_value,
			trick_value = trick_value,
			style_points = style_points
	}

# CHANGE THESE FUNCTION NAMES TO MAKE MORE SENSE AS A CLASS

# upgrade trick points (added)
func learn_trick(cost: int, added_value: int) -> bool: 
	var cost_check = cost_check(cost)
	if cost_check == false:
		return false
	else:
		active_value -= cost
		trick_value += added_value
		return true
	
# upgrade trick points (multplied)
func upgrade_trick(cost: int, upgrade: int) -> bool:
	var cost_check = cost_check(cost)
	if cost_check == false:
		return false
	else:
		active_value -= cost
		trick_value *= upgrade
		return true
		
# upgrade click value (points)
func upgrade_click(cost: int, upgrade: int):
	active_value -= cost
	click_value * upgrade
	
# upgrade style points
func upgrade_style(cost, upgrade):
	active_value -= cost
	if style_points == 0:
		style_points += upgrade
	style_points * upgrade
	
# TOO FAST
# update active_value with calculate
func update_active_value():
	var currentCalculation: int = calculate()
	active_value += currentCalculation

# calculate points (equation)
func calculate() -> int:
	var solution: int = ((click_value + trick_value) * style_points)
	return solution
	
# check 'buy' costs to active_value
func cost_check(cost) -> bool:
	var bool_check: bool
	if active_value < cost:
		bool_check = false
	bool_check = true                                           
	return bool_check

# DEBUG: reset values to default
func reset():
	active_value = 0
	click_value = 1
	trick_value = 0
	style_points = 0
