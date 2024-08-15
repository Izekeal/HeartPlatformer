extends ColorRect

#these three functions will need to be created in world.gd
signal resume()
signal restart_level()
signal main_menu()

@onready var resume_button = %ResumeButton
@onready var restart_level_button = %RestartLevelButton
@onready var main_menu_button = %MainMenuButton
@onready var pause_level_one = %PauseLevelOne
@onready var pause_level_two = %PauseLevelTwo
@onready var pause_level_three = %PauseLevelThree
@onready var pause_level_four = %PauseLevelFour
@onready var pause_level_five = %PauseLevelFive



func _ready():
	pause_level_one.text = str("Warmup:  ") + str(LevelTime.level_one_time / 1000.0)
	pause_level_two.text = str("The Gaps:  ") + str(LevelTime.level_two_time / 1000.0)
	pause_level_three.text = str("Big Jump:  ") + str(LevelTime.level_three_time / 1000.0)
	pause_level_four.text = str("Gauntlet:  ") + str(LevelTime.level_four_time / 1000.0)
	pause_level_five.text = str("Islands:  ") + str(LevelTime.level_five_time / 1000.0)

func _on_resume_button_pressed():
	resume.emit()


func _on_restart_level_button_pressed():
	restart_level.emit()


func _on_main_menu_button_pressed():
	main_menu.emit()
