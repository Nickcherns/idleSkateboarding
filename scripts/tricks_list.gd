extends Control

@export var PointSystem : IncrementalSystem
var cost_check: bool


# Called when the node enters the scene tree for the first time.
func _ready():
	$"../cantAfford".visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_learn_kickflip_pressed():
	cost_check = PointSystem.learn_trick(1, 2)
	if cost_check == false:
		$"../cantAfford".visible = true
		$"../cantAfford/errorTimer".start()

