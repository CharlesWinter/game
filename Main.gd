extends Node

var elapsed_rounds
var current_phase

# Called when the node enters the scene tree for the first time.
func _ready():
	elapsed_rounds = 0

func new_game():
	$HUD.show_message("Starting the Game!")
	current_phase = "movement phase"
	$PhaseTracker.start(current_phase)

func _on_PhaseTracker_done():
	$HUD.show_message("New Phase!")
	toggle_phase()
	$PhaseTracker.start(current_phase)
	
func toggle_phase():
	if current_phase == "movement phase":
		current_phase = "shooting phase"
	else:
		current_phase = "movement_phase"
