extends Label

func _process(_delta):
	self.text = "Fruit: " + str(Global.fruit_1)
