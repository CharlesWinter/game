extends CanvasLayer


signal start_game

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _on_BeginGameButton_pressed():
	$BeginGameButton.hide()
	emit_signal("start_game")

func _on_MessageTimer_timeout():
	$MessageLabel.hide()

func _on_Main_move_phase_start():
	show_message("move phase has started")
	$PhaseValueLabel.text = "Movement Phase"
	
func _on_Main_move_phase_end():
	show_message("move phase has ended")
	$PhaseValueLabel.text = "Movement Phase Has Finished!"


