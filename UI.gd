extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_tricks_pressed():
	$tricksList.visible = true
	$upgradesList.visible = false


func _on_upgrades_pressed():
	$upgradesList.visible = true
	$tricksList.visible = false


func _on_extras_pressed():
	pass # Replace with function body.


func _on_options_pressed():
	if $optionsMenu.visible == true:  
		$optionsMenu.visible = false
		return

	$optionsMenu.visible = true

func _on_exit_pressed():
	get_tree().quit()
