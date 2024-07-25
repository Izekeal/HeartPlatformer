extends CenterContainer

@onready var level_one_button = %LevelOneButton
@onready var level_two_button = $VBoxContainer/LevelTwoButton
@onready var level_three_button = $VBoxContainer/LevelThreeButton
@onready var level_four_button = $VBoxContainer/LevelFourButton
@onready var level_five_button = $VBoxContainer/LevelFiveButton
@onready var back_button = $VBoxContainer/BackButton


# Called when the node enters the scene tree for the first time.
func _ready():
	level_one_button.grab_focus()


func _on_level_one_button_pressed():
	get_tree().change_scene_to_file("res://level_one.tscn")


func _on_level_two_button_pressed():
	get_tree().change_scene_to_file("res://level_two.tscn")


func _on_level_three_button_pressed():
	get_tree().change_scene_to_file("res://level_three.tscn")


func _on_level_four_button_pressed():
	get_tree().change_scene_to_file("res://level_four.tscn")


func _on_level_five_button_pressed():
	get_tree().change_scene_to_file("res://level_five.tscn")


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://start_menu.tscn")
