extends Control

@export var profile: UpgradeItem

@onready var name_label = $Panel/name
@onready var descript_label = $Panel/description
@onready var cost_label = $Panel/cost
@onready var train_button = $Panel/train
@onready var learned_stamp = $LearnedStamp
signal cant_afford

# Called when the node enters the scene tree for the first time.
func _ready():
	name_label.text = profile.name
	descript_label.text = profile.description
	cost_label.text = "Cost: " + str(profile.cost)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_train_pressed():
	var cost_check = profile.cost_check()
	var tween = get_tree().create_tween()
	if cost_check == true:
		profile.handle_training()
		train_button.disabled = true
		learned_stamp.visible = true
		tween.tween_property(learned_stamp, "scale", Vector2(2.5, 2), 0.5)
		tween.tween_property(learned_stamp, "scale", Vector2(2, 1.5), 0.5)
	else:
		emit_signal("cant_afford")
	
