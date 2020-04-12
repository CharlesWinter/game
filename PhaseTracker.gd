extends CanvasLayer

signal done

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _process(delta):
	$PhaseTimRemainingLabel.text = String($PhaseTimer.time_left)

func start(phase):
	$PhaseTimer.start()
	$PhaseProgressLabel.text = phase
	
func _on_PhaseTimer_timeout():
	emit_signal("done")
