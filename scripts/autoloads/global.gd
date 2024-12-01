extends Node

var player: Node
var camera: Camera3D
var cursor: Node
var current_seed: String = "ASFASD"
var crystal: Node



var palatte: Array = [
    Color.html("#0f052d"),
    Color.html("#203671"),
    Color.html("#36868f"),
    Color.html("#ff004b"),
]

var records: Dictionary = {
	"Junk": {
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
    var string: String = "Junks: " + str(records["Junk"]["Current Run"]) + "\n"
    return string
