extends Control

@export var PointSystem : IncrementalSystem

@export var basics_cost: int = 1
@export var push_harder_cost: int = 1
@export var some_style_cost: int = 1
@export var some_tricks_cost: int = 1
@export var calculate_feet_cost: int = 1
@export var copy_pro_cost: int = 1
var cost_check: bool

var cost_text = "Cost: {upgrade_cost}"

# Called when the node enters the scene tree for the first time.
func _ready():
	$HBoxContainer/LearnBasics/Cost.text = cost_text.format(
		{"upgrade_cost": basics_cost}
	)
	$HBoxContainer/pushHarder/Cost.text = cost_text.format(
		{"upgrade_cost": push_harder_cost}
	)
	$HBoxContainer/learnStyle/Cost.text = cost_text.format(
		{"upgrade_cost": some_style_cost}
	)
	$HBoxContainer/learnTricks/Cost.text = cost_text.format(
		{"upgrade_cost": some_tricks_cost}
	)
	$HBoxContainer/CalculateFeet/Cost.text = cost_text.format(
		{"upgrade_cost": calculate_feet_cost}
	)
	$HBoxContainer/CopyAPro/Cost.text = cost_text.format(
		{"upgrade_cost": copy_pro_cost}
	)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# learn how to skate br0
func _on_train_basics_pressed():
	cost_check = PointSystem.upgrade_style(basics_cost, 1)
	get_tree().call_group("PerSecTimer", "start")

func _on_train_push_harder_pressed():
	PointSystem.upgrade_click(push_harder_cost, 2)

func _on_train_some_style_pressed():
	PointSystem.upgrade_style(some_style_cost, 2)

func _on_train_some_tricks_pressed():
	# need to connect this to visibility for trick list and perform list
	#get_tree().call_group( , )
	pass

func _on_train_calculate_feet_pressed():
	PointSystem.upgrade_click(calculate_feet_cost, 2)

func _on_train_copy_a_pro_pressed():
	# only cast the cost one to prevent duplicate cost deduction
		# could cast half-cost to each upgrade call
	PointSystem.upgrade_click(copy_pro_cost, 2)
	PointSystem.upgrade_trick(0, 2)


