@tool
extends EditorPlugin

const plugin = preload("res://addons/compresswasmplugin/CompressAndChangeReferencesExportPlugin.gd")
var export_plugin = CompressAndChangeReferencesExportPlugin.new()

func _enter_tree():
	add_export_plugin(export_plugin)

func _exit_tree():
	remove_export_plugin(export_plugin)
