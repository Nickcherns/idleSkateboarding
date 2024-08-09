extends Control

@export var profile: TrickItem
@onready var name_label = $Panel/name
@onready var descript_label = $Panel/description
@onready var cost_label = $Panel/cost
@onready var train_button = $Panel/train
@onready var learned_stamp = $LearnedStamp
@onready var PointSystem = preload("res://resources/PointSystem.tres")
@onready var locked_stamp = $LockedStamp
signal cant_afford

# Called when the node enters the scene tree for the first time.
func _ready():
	name_label.text = profile.name
	descript_label.text = profile.description
	cost_label.text = "Cost: " + str(profile.cost)
	PointSystem.unlock_flip.connect(unlock_flip_tricks)
	PointSystem.unlock_nollie_flip.connect(unlock_nollie_flip_tricks)
	if profile.locked:
		locked_stamp.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if profile.locked == true:
		train_button.disabled = true
	elif profile.locked == false:
		locked_stamp.visible = false
		train_button.disabled = false

func unlock_flip_tricks() -> void:
	if profile.flip_trick == true:
		profile.unlock_trick()

func unlock_nollie_flip_tricks() -> void:
	if profile.nollie_flip_trick == true:
		profile.unlock_trick()

func _on_train_pressed():
	var cost_check = profile.cost_check()
	if cost_check == true:
		profile.trick_trained()
		var tween = get_tree().create_tween()
		train_button.disabled = true
		learned_stamp.visible = true
		tween.tween_property(learned_stamp, "scale", Vector2(2.5, 2), 0.5)
		tween.tween_property(learned_stamp, "scale", Vector2(2, 1.5), 0.5)
	else:
		emit_signal("cant_afford")
	
