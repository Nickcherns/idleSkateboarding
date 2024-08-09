extends Control

@onready var cant_afford_timer = $cantAfford/errorTimer
@onready var cant_afford_label = $cantAfford
@onready var upgrade_list: Node = $UpgradeListScroll
@onready var upgrade_list_container: Node = $UpgradeListScroll/UpgradesList
@onready var perform_list: Node = $PerformList
@onready var trick_list: Node = $TrickListScroll
@onready var upgrades_label: Node = $upgrades
@onready var perform_label: Node = $perform
@onready var tricks_label: Node = $tricks


# Called when the node enters the scene tree for the first time.
func _ready():
	var upgrade_compenents: Array[Node] = upgrade_list_container.get_children()
	for i in range(len(upgrade_compenents)):
		upgrade_compenents[i].cant_afford.connect(display_cant_afford)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func display_cant_afford():
	cant_afford_label.visible = true
	cant_afford_timer.start()
	
func _on_tricks_pressed():
	upgrade_list.visible = false
	perform_list.visible = false
	trick_list.visible = true
	upgrades_label.visible = false
	perform_label.visible = false
	tricks_label.visible = true

func _on_upgrades_pressed():
	trick_list.visible = false
	tricks_label.visible = false
	perform_label.visible = false
	perform_list.visible = false
	upgrade_list.visible = true
	upgrades_label.visible = true

func _on_perform_pressed():
	upgrade_list.visible = false
	upgrades_label.visible = false
	trick_list.visible = false
	tricks_label.visible = false
	perform_list.visible = true
	
func _on_extras_pressed():
	pass # Replace with function body.

func _on_options_pressed():
	if $CanvasLayer3/optionsMenu.visible == true:  
		$CanvasLayer3/optionsMenu.visible = false
		return
	$CanvasLayer3/optionsMenu.visible = true

func _on_exit_pressed():
	get_tree().quit()

func _on_clicker_button_pressed():
	get_tree().call_group("skateboard", "kickPushActive")

func _on_error_timer_timeout():
	cant_afford_label.visible = false
