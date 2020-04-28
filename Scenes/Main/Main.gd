extends Control

onready var graph = $Background/Absence/VSplitContainer/GraphContainer/Graph
onready var messages = $Background/Messages/VBoxContainer/MessageContainer

# Load a scene and set the required data
func load_scene(user):
	print("Loading data")
	var data = load_file("./data/data.json")
	
	if (data):
		print(data)
		var user_data = data[user]
		
		# Set data
		graph.set_graph_data(user_data["absence"])
		messages.set_message_data(user_data["messages"])

# Load file and convert JSON to dictionary, save the contents to <data>
func load_file(path):
	var file = File.new()
	var data = null
	
	if (file.file_exists(path)):
		print("Loading", str(path))
		file.open(path, File.READ)
		data = parse_json(file.get_as_text())
		file.close()
	else:
		print("Error:", str(path), "does not exist")
		var error = load("res://Scenes/Other/ErrorPopup.tscn").instance()
		add_child(error)
		error.popup()
		
	return data

# Remove scene when logging out
func _on_Logout_pressed():
	print("Logging out")
	queue_free()
