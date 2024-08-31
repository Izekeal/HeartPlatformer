extends Node2D

@export var next_level: PackedScene

var level_time = 0.0
var start_level_msec = 0.0

@onready var start_in_label = %StartInLabel
@onready var start_in = %StartIn
@onready var animation_player = $AnimationPlayer
@onready var level_completed = $CanvasLayer/LevelCompleted
@onready var level_time_label = %LevelTimeLabel
@onready var pause_menu = %PauseMenu

func _ready():
	if not next_level is PackedScene:
		level_completed.next_level_button.text = "Victory Screen"
		next_level = load("res://victory_screen.tscn")
		
	Events.level_completed.connect(show_level_completed)
	get_tree().paused = true
	start_in.visible = true
	LevelTransition.fade_from_black()
	level_countdown()
	await animation_player.animation_finished
	get_tree().paused = false
	start_in.visible = false
	start_level_msec = Time.get_ticks_msec()
	
func _process(delta):
	level_time = Time.get_ticks_msec() - start_level_msec
	level_time_label.text = str(level_time / 1000.0)
	if Input.is_action_just_pressed("pause_menu"):
		paused()
	
func retry():
	await LevelTransition.fade_to_black()
	get_tree().paused = false
	get_tree().change_scene_to_file(scene_file_path)
	
func level_countdown():
	if scene_file_path == ("res://level_one.tscn"):
		animation_player.play("level_one")
	if scene_file_path == ("res://level_two.tscn"):
		animation_player.play("level_two")
	if scene_file_path == ("res://level_three.tscn"):
		animation_player.play("level_three")
	if scene_file_path == ("res://level_four.tscn"):
		animation_player.play("level_four")
	if scene_file_path == ("res://level_five.tscn"):
		animation_player.play("level_five")
	
func go_to_next_level():
	if not next_level is PackedScene: return
	log_level_time()
	await LevelTransition.fade_to_black()
	get_tree().paused = false
	get_tree().change_scene_to_packed(next_level)
	

func show_level_completed():
	level_completed.show()
	#See if it makes more sense to have the next_level button grab focus
	#Ask for player feedback on that decision
	level_completed.retry_button.grab_focus()
	get_tree().paused = true
	

func log_level_time():
	if scene_file_path == ("res://level_one.tscn"):
		LevelTime.level_one_time = level_time
	if scene_file_path == ("res://level_two.tscn"):
		LevelTime.level_two_time = level_time
	if scene_file_path == ("res://level_three.tscn"):
		LevelTime.level_three_time = level_time
	if scene_file_path == ("res://level_four.tscn"):
		LevelTime.level_four_time = level_time
	if scene_file_path == ("res://level_five.tscn"):
		LevelTime.level_five_time = level_time
	
func _on_level_completed_retry():
	retry()

func _on_level_completed_next_level():
	go_to_next_level()

func paused():
	get_tree().paused = true
	pause_menu.show()
	pause_menu.resume_button.grab_focus()
	
func _on_pause_menu_resume():
	get_tree().paused = false
	pause_menu.hide()
	
func _on_pause_menu_main_menu():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://start_menu.tscn")

func _on_pause_menu_restart_level():
	retry()
