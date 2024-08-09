extends Resource

class_name IncrementalSystem
	
@export var active_value: int
@export var click_value: int
@export var trick_score: int  
@export var trick_multi: int
@export var style_points: int
var per_sec_value: int
var trick_value = (trick_score * trick_multi)

signal unlock_flip
signal unlock_nollie_flip

# Called when the node enters the scene tree for the first time.
func _ready():
	per_sec_value = calculate()
	trick_value = (trick_score * trick_multi)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# add click_value to active_value (each click)
func click():
	active_value += click_value
	
# return all current values
func return_values() -> Dictionary:
	return {
			active_value = active_value,
			per_sec_value = per_sec_value,
			click_value = click_value,
			trick_value = (trick_score * trick_multi),
			style_points = style_points
	}

func unlock_flip_tricks() -> void:
	emit_signal("unlock_flip")

func unlock_nollie_flip_tricks() -> void:
	emit_signal("unlock_nollie_flip")

#double upgrade (style & trick)
func upgrade_double(cost: int, upgrade_value: int) -> void:
	style_points *= upgrade_value
	trick_multi *= upgrade_value
	trick_value = (trick_score * trick_multi)

# upgrade trick points (added)
func add_to_trick(cost: int, added_value: int) -> void: 
	active_value -= cost
	trick_score += added_value
	trick_value = (trick_score * trick_multi)
	
# upgrade trick points (multplied)
func multi_trick(cost: int, upgrade: int) -> void:
	active_value -= cost
	trick_multi *= upgrade
	trick_value = (trick_score * trick_multi)

# upgrade click value (points)
func multi_click(cost: int, upgrade: int) -> void:
	active_value -= cost
	click_value *= upgrade
	
# upgrade style points
func multi_style(cost, upgrade) -> void:
	active_value -= cost
	style_points *= upgrade

func add_to_style(cost, upgrade) -> void:
	active_value -= cost
	style_points += upgrade
	
# TOO FAST
# update active_value with calculate
func update_active_value():
	per_sec_value = calculate()
	active_value += per_sec_value

# calculate points (equation)
func calculate() -> int:
	var solution: int = ((click_value + trick_value) * style_points)
	return solution

# DEBUG: reset values to default
func reset():
	active_value = 0
	per_sec_value = calculate()
	click_value = 1
	trick_value = (trick_score * trick_multi)
	trick_multi = 1
	trick_score = 0
	style_points = 1
