extends Control

@export var PointSystem : IncrementalSystem
var main_label_text = "Current Value: {active_value}"
var trick_value_text = "Trick Value: {trick_value}"
var click_value_text = "Click Value: {click_value}"
var style_points_text = "Style Points: {style_points}"
var equation_text = "{per_sec_value} = ( {click_value} + {trick_value} ) x {style_points}"
@onready var current_values = PointSystem.return_values() 
@onready var value_panel_active: Label = $ValuePanel/VBoxContainer/ActiveValue
@onready var value_panel_trick: Label = $ValuePanel/VBoxContainer/TrickValue
@onready var value_panel_click: Label = $ValuePanel/VBoxContainer/ClickValue
@onready var value_panel_style: Label = $ValuePanel/VBoxContainer/StylePoints
@onready var value_panel_equation: Label = $ValuePanel/VBoxContainer/Equation
@onready var per_sec_label: Label = $TimerLabel/TimerLabel
@onready var per_sec_timer: Timer = $PerSec

# Called when the node enters the scene tree for the first time.
func _ready():
	set_current_values()
	per_sec_timer.start()	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	set_current_values()
	
func _on_per_sec_timeout() -> void:
	PointSystem.update_active_value()

func _on_clicker_button_pressed() -> void:
	PointSystem.click()
	set_current_values()

func _on_reset_pressed() -> void:
	PointSystem.reset()

func set_current_values() -> void:
	current_values = PointSystem.return_values() 
	value_panel_active.text = main_label_text.format(
		{"active_value": current_values.active_value})
	value_panel_trick.text = trick_value_text.format(
		{"trick_value": current_values.trick_value})
	value_panel_click.text = click_value_text.format(
		{"click_value": current_values.click_value})
	value_panel_style.text = style_points_text.format(
		{"style_points": current_values.style_points})
	value_panel_equation.text = equation_text.format(
		{"per_sec_value": current_values.per_sec_value,
		 "click_value": current_values.click_value,
		 "trick_value": current_values.trick_value,
		 "style_points": current_values.style_points})
	per_sec_label.text = str(per_sec_timer.time_left)
