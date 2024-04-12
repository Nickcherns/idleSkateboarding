extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_tricks_pressed():
	$CanvasLayer2/UpgradesList.visible = false
	$CanvasLayer2/upgrades.visible = false
	$CanvasLayer2/perform.visible = false
	$CanvasLayer2/PerformList.visible = false
	$CanvasLayer2/TrickList.visible = true
	$CanvasLayer2/tricks.visible = true


func _on_upgrades_pressed():
	$CanvasLayer2/TrickList.visible = false
	$CanvasLayer2/tricks.visible = false
	$CanvasLayer2/perform.visible = false
	$CanvasLayer2/PerformList.visible = false
	$CanvasLayer2/UpgradesList.visible = true
	$CanvasLayer2/upgrades.visible = true


func _on_perform_pressed():
	$CanvasLayer2/UpgradesList.visible = false
	$CanvasLayer2/upgrades.visible = false
	$CanvasLayer2/TrickList.visible = false
	$CanvasLayer2/tricks.visible = false
	$CanvasLayer2/perform.visible = true
	$CanvasLayer2/PerformList.visible = true
	
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
	$CanvasLayer2/cantAfford.visible = false
