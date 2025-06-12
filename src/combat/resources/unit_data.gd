extends Resource

class_name UnitData

@export var stats: Dictionary[STAT.TYPE, StatData] = {}

func _init():
#	TODO: Do something else
	for t in STAT.TYPE.values():
		stats.set(t as STAT.TYPE, StatData.new())
