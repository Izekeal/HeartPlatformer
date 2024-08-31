extends ColorRect

signal retry()
signal next_level()

@onready var run_killer = 1
@onready var retry_button = %RetryButton
@onready var next_level_button = %NextLevelButton

#func _ready():
#	next_level_button.grab_focus()

func _on_retry_button_pressed():
	if run_killer == 1:
		run_killer = 2
		retry.emit()


func _on_next_level_button_pressed():
	if run_killer == 1:
		run_killer = 2
		next_level.emit()
