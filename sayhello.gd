extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Button").connect("pressed", self, "_on_Button_pressed")
	pass # Replace with function body.

func _on_Button_pressed():
	get_node("Label").text = "Hello there!"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
