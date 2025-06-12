extends Resource

class_name StatData

var _mods: Array[StatModData] = []

@export var base: int:
	get:
		return base
	set(v):
		var diff: int = v - base
		base = v
		value += diff

var value: int = 0:
	get:
		return value
	set(v):
		value = clampi(v, 0, base + get_total_mod())
		on_update.emit()

signal on_update()

func _init():
	value = base

func get_total_mod() -> int:
	return _mods.reduce(func(acc, num): return acc + num, 0)

func add_mod(mod: StatModData):
	_mods.append(mod)
	value = value
	mod.on_remove.connect(func(): remove_mod(mod), CONNECT_ONE_SHOT)

func remove_mod(mod: StatModData):
	_mods.erase(mod)
