# Displays the contents of a file in a label. Remember, .txt files are not
# normally included in a project export, so add an exception in the export
# settings for each target.

class_name FileCat
extends Label

export (String, FILE) var source_file


func update_content():
	var file = File.new()
	if file.file_exists(source_file):
		file.open(source_file, File.READ)
		text = file.get_as_text().strip_edges()
		file.close()
	else:
		text = source_file + " not found."


func _ready():
	update_content()
