extends CenterContainer

@onready var start_game_button = %StartGameButton


func _ready():
	RenderingServer.set_default_clear_color(Color.BLACK)
	#Reset the level times to zero as this clears the times from the pause menu
	LevelTime.level_one_time = 0
	LevelTime.level_two_time = 0
	LevelTime.level_three_time = 0
	LevelTime.level_four_time = 0
	LevelTime.level_five_time = 0
	start_game_button.grab_focus()

func _on_start_game_button_pressed():
	await LevelTransition.fade_to_black()
	get_tree().change_scene_to_file("res://level_one.tscn")
	LevelTransition.fade_from_black()

func _on_quit_button_pressed():
	get_tree().quit()

func _on_level_select_button_pressed():
	get_tree().change_scene_to_file("res://level_selector.tscn")
