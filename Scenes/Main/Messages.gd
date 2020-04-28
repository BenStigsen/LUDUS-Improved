extends ScrollContainer

onready var scene_message = preload("res://Scenes/Main/Message.tscn")

func set_message_data(data):
	var amount_of_elements = len(data)
	
	var path = "Panel/VBoxContainer/"

	# Add messages to the message box from oldest to newest
	if (amount_of_elements > 0):
		for i in range(amount_of_elements - 1, -1, -1):
			var id = str(i + 1)
			var message = data[id]
			
			var instance_message = scene_message.instance()

			if (!message["unread"]):
				instance_message.get_node(path + "HBoxContainer/TextureRect").modulate = Color(0, 0, 0, 0)
				
			instance_message.get_node(path + "PanelContainer/Subject").text = message["subject"]
			instance_message.get_node(path + "HBoxContainer/Date").text = message["date"]
			instance_message.get_node(path + "HBoxContainer/Sender").text = message["sender"]
			instance_message.get_node("Popup").dialog_text = message["message"]

			# Add Message
			$VBoxContainer.add_child(instance_message)
