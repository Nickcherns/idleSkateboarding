extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_tricks_pressed():
	$CanvasLayer2/tricksList.visible = true
	$CanvasLayer2/tricks.visible = true
	$CanvasLayer2/upgradesList.visible = false
	$CanvasLayer2/upgrades.visible = false


func _on_upgrades_pressed():
	$CanvasLayer2/upgradesList.visible = true
	$CanvasLayer2/upgrades.visible = true
	$CanvasLayer2/tricksList.visible = false
	$CanvasLayer2/tricks.visible = false


func _on_extras_pressed():
	pass # Replace with function body.


func _on_options_pressed():
	if $CanvasLayer3/optionsMenu.visible == true:  
		$CanvasLayer3/optionsMenu.visible = false
		return

	$CanvasLayer3/optionsMenu.visible = true

func _on_exit_pressed():
	get_tree().quit()
