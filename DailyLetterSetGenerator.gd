class_name DailyLetterSetGenerator extends Node

@export var statsFile : JSON

var data = {}
var generated_set = []

var daySeed : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func generate(count: int):
	var date = Time.get_date_dict_from_system(true)
	daySeed = Time.get_unix_time_from_datetime_dict(date)
	seed(daySeed)
	
	load_letter_distribution()
	
	generated_set = []
	for i in count:
		var r = randf()
		for d in data:
			if (r < data[d]):
				generated_set.append(d)
				break
	
	return generated_set

func load_letter_distribution() -> void:
	var rawdata = statsFile.data
	data = {}
	var cumulative = 0.0
	for d in rawdata:
		cumulative += rawdata[d]
		data[d] = cumulative
