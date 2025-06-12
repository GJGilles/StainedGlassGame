extends Resource

class_name StatSecondaryData

#TODO: Can I make this general so that any stat can derive from any other?
@export var stat: StatData

@export var base: int = 0
@export var scaling: float = 1.0

var value: int:
	get:
		return value
	set(v):
		pass
