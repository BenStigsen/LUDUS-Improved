extends AcceptDialog

func _on_PanelContainer_gui_input(event):
	if (event is InputEventMouseButton):
		if (event.button_index == BUTTON_LEFT):
			popup()
