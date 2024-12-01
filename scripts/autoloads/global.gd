extends Node

var player: Node
var camera: Camera3D
var cursor: Node
var current_seed: String = "ASFASD"
var crystal: Node

var junks: int


var palatte: Array = [
    Color.html("#0f052d"),
    Color.html("#203671"),
    Color.html("#36868f"),
    Color.html("#ff004b"),
]

var records: Dictionary = {
	"Junks": {
		"Current Run": 0,
        "Total Run": 0,
		"Total All Time": 0
	},  
	"Level": {
		"Current Run": 0,
		"Total All Time": 0,
        "Highest All Time": 0
	},
    "Kills": {
        "Current Run": 0,
            "Total All Time": 0
    },
    "Damage Dealt": {
        "Current Run": 0,
        "Total All Time": 0
    },
    "XP": {
        "Current Run": 0,
        "Total All Time": 0
    }
}

func _process(delta: float) -> void:
    records["Junks"]["Current Run"] = junks

# Get records string
func get_records_string() -> String:
    var string: String = ""
    # Iterate through records
    for key in records:
        string += "[b]%s:[/b]\n" % [key]
        for sub_key in records[key]:
            string += "%s: %s\n" % [sub_key, records[key][sub_key]]
        string += "\n"
    return string


func get_stats_string() -> String:
    var string: String = "Junkss: " + str(records["Junks"]["Current Run"]) + "\n"
    return string
