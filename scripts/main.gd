extends Control

@export var PointSystem : IncrementalSystem


var main_label_text = "Current Value: {active_value}"
var trick_value_text = "Trick Value: {trick_value}"
var click_value_text = "Click Value: {click_value}"
var style_points_text = "Style Points: {style_points}"
var equation_text = "{active_value} = ( {click_value} + {trick_value} ) x {style_points}"
@onready var current_values = PointSystem.return_values() 

# Called when the node enters the scene tree for the first time.
func _ready():
	print(current_values)
	$ValuePanel/VBoxContainer/ActiveValue.text = main_label_text.format(
		{"active_value": current_values.active_value})
	$ValuePanel/VBoxContainer/TrickValue.text = trick_value_text.format(
		{"trick_value": current_values.trick_value})
	$ValuePanel/VBoxContainer/ClickValue.text = click_value_text.format(
		{"click_value": current_values.click_value})
	$ValuePanel/VBoxContainer/StylePoints.text = style_points_text.format(
		{"style_points": current_values.style_points})
	$ValuePanel/VBoxContainer/Equation.text = equation_text.format(
		{"active_value": current_values.active_value,
		 "click_value": current_values.click_value,
		 "trick_value": current_values.trick_value,
		 "style_points": current_values.style_points})
		

	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	current_values = PointSystem.return_values() 
	
	
	$ValuePanel/VBoxContainer/ActiveValue.text = main_label_text.format({"active_value": current_values.active_value})
	$ValuePanel/VBoxContainer/ActiveValue.text = main_label_text.format(
		{"active_value": current_values.active_value})
	$ValuePanel/VBoxContainer/TrickValue.text = trick_value_text.format(
		{"trick_value": current_values.trick_value})
	$ValuePanel/VBoxContainer/ClickValue.text = click_value_text.format(
		{"click_value": current_values.click_value})
	$ValuePanel/VBoxContainer/StylePoints.text = style_points_text.format(
		{"style_points": current_values.style_points})
	$ValuePanel/VBoxContainer/Equation.text = equation_text.format(
		{"active_value": current_values.active_value,
		 "click_value": current_values.click_value,
		 "trick_value": current_values.trick_value,
		 "style_points": current_values.style_points})
	$TimerLabel/TimerLabel.text = str($PerSec.time_left)
	
func _on_per_sec_timeout():
	PointSystem.update_active_value()
	

func _on_clicker_button_pressed():
	PointSystem.click()
	$ValuePanel/VBoxContainer/ActiveValue.text = main_label_text.format({"active_value": current_values.active_value})


func _on_reset_pressed():
	PointSystem.reset()



