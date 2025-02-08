@tool
extends EditorPlugin

var dialogue := preload("res://dialogue.tres")

var _last_val: Resource


func _save_external_data() -> void:
	ResourceSaver.save(dialogue, dialogue.resource_path)
	prints("SAVING RESOURCE", dialogue.resource_path)


## On every frame check whether content of the DialogueGraph's steps array
## hasn't changed. There's absolutely no reason for it to change since we are
## not even accessing it anywhere else really.
func _process(_delta: float) -> void:
	if _last_val != dialogue.subresource:
		prints("CHANGED FROM",  _last_val, "to", dialogue.subresource)
		_last_val = dialogue.subresource
