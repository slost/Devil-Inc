extends Label

func _process(delta: float) -> void:
    text = str(Debug.get_label())
