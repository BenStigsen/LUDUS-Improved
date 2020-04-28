extends Control

# Node shortcuts
onready var node_username = $Login/VBoxContainer/LineUsername
onready var node_password = $Login/VBoxContainer/LinePassword
onready var node_status = $Login/VBoxContainer/Status

var users
var scene_main = preload("res://Scenes/Main/Main.tscn")

# Open file, convert JSON to dictionary, save data to <users>
func _ready():
	var file = File.new()
	var path = "./data/users.json"
	
	if (file.file_exists(path)):
		file.open(path, File.READ)
		users = parse_json(file.get_as_text())
		file.close()
	else:
		# Show error and exit
		print("Error: file users.json doesn't exist, exiting application")
		var error = load("res://Scenes/Other/ErrorPopup.tscn").instance()
		add_child(error)
		error.popup()
		

# Login
func _on_ButtonLogin_pressed():
	print("Pressed Login")
	var user = (node_username.text).strip_edges()
	var password = (node_password.text).strip_edges()
	
	# Check if the entered username and password is valid
	if (user in users) and (users[user] == password):
		print("Successful Login")
		
		# Clear Login
		node_username.clear()
		node_password.clear()
		node_status.text = ""
		
		# Load Main Scene
		var scene = scene_main.instance()
		add_child(scene)
		scene.load_scene(user)
	else:
		# Error
		print("Wrong username or password was entered")
		node_status.text = "Brugernavn og/eller adgangskode er forkert"
		node_password.clear()

# Toggle password secret characters
func _on_ShowPassword_pressed():
	node_password.secret = !node_password.secret
