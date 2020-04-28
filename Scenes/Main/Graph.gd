extends Control

var graph_data = []

func set_graph_data(data):
	print("Updating graph data")
	var amount_of_elements = len(data)
	
	var size = self.get_size()
	
	var width = size[0]
	var height = size[1]

	for i in range(amount_of_elements):
		graph_data.append(Vector2(i * (width / (amount_of_elements - 1)), (height + 4) - (data[i] * (height / 100))))
	
	# Draw new data
	update()

# Draw absence graph
func _draw():
	if (len(graph_data) > 1):
		self.draw_polyline(PoolVector2Array(graph_data), Color(255, 100, 100), 1.0, true)
