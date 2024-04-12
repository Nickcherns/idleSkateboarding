extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_nose_manual_pressed():
	get_tree().call_group("skateboard", "performNosemanual")


func _on_manual_pressed():
	get_tree().call_group("skateboard", "performManual")


func _on_nollie_heelflip_pressed():
	get_tree().call_group("skateboard", "performNollieHeelflip")


func _on_nollie_kickflip_pressed():
	get_tree().call_group("skateboard", "performNollieKickflip")


func _on_tre_flip_pressed():
	pass # Replace with function body.


func _on_heelfip_pressed():
	get_tree().call_group("skateboard", "performHeelflip")


func _on_kick_flip_pressed():
	get_tree().call_group("skateboard", "performKickflip")


func _on_ollie_pressed():
	pass # Replace with function body.
