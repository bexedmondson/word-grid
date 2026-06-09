extends Control

@export var dailyGenerator : DailyLetterSetGenerator

func convert_to_save_string(score: int):
	return str(dailyGenerator.daySeed + score)
	
func convert_from_save_string(saveString : String):
	var saveNumber = saveString.to_int()
	var day = saveNumber - saveNumber % 86400
	print(Time.get_date_dict_from_unix_time(day))
	
var done = false
func _process(delta: float) -> void:
	if (done):
		return
	if (dailyGenerator.daySeed == 0):
		return
	print(dailyGenerator.daySeed)
	convert_from_save_string(str(dailyGenerator.daySeed))
	done = true