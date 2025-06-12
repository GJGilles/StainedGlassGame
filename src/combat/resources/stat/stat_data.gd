extends Resource

class_name StatData

var _mods: Array[StatModData] = []

@export var stat_scaling: Dictionary[StatData, float] = {}

@export var min: int = 0
@export var max: int = 100

@export var base: int:
	get:
		return base
	set(v):
		var diff: int = v - base
		base = v
		value += diff

var base_total: int:
	get:
		var val: int = base
		val += stat_scaling.keys().reduce(func(acc, stat): stat.value * stat_scaling[stat])
		val += _mods.reduce(func(acc, num): return acc + num, 0)
		return clampi(val, min, max)

var value: int = 0:
	get:
		return value
	set(v):
		value = clampi(v, min, base_total)
		on_update.emit()

signal on_update()

func _init():
	value = base_total
	for stat: StatData in stat_scaling.keys():
		stat.on_update.connect(_reset_base)

func _reset_base():
	base = base

func add_mod(mod: StatModData):
	_mods.append(mod)
	value = value
	mod.on_remove.connect(func(): remove_mod(mod), CONNECT_ONE_SHOT)

func remove_mod(mod: StatModData):
	_mods.erase(mod)
