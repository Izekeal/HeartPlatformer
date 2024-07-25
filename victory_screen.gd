extends CenterContainer

@onready var menu_button = %MenuButton
@onready var level_one_label = %LevelOneLabel
@onready var level_two_label = %LevelTwoLabel
@onready var level_three_label = %LevelThreeLabel
@onready var level_four_label = %LevelFourLabel
@onready var level_five_label = %LevelFiveLabel
@onready var game_total_label = %GameTotalLabel

var game_total = 0.0


func _ready():
	LevelTransition.fade_from_black()
	menu_button.grab_focus()
	level_one_label.text = str("L1: ") + str(LevelTime.level_one_time / 1000.0)
	level_two_label.text = str("L2: ") + str(LevelTime.level_two_time / 1000.0)
	level_three_label.text = str("L3: ") + str(LevelTime.level_three_time / 1000.0)
	level_four_label.text = str("L4: ") + str(LevelTime.level_four_time / 1000.0)
	level_five_label.text = str("L5: ") + str(LevelTime.level_five_time / 1000.0)
	
	game_total = LevelTime.level_one_time + LevelTime.level_two_time + LevelTime.level_three_time + LevelTime.level_four_time + LevelTime.level_five_time
	game_total_label.text = str("T: ") + str(game_total / 1000.0)
	
func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://start_menu.tscn")
