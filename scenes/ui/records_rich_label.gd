extends RichTextLabel

func _process(_delta: float) -> void:
    text = Global.get_records_string()
