extends AcceptDialog

# Quit on error
func _on_ErrorPopup_confirmed():
	get_tree().quit()
