extends Resource

class_name StatModData

var value: int = 0

signal on_remove()

func remove():
	on_remove.emit()
