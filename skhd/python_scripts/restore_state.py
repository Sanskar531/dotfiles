import argparse
import json
from typing import Any
from pathlib import Path
import subprocess

"""
Sample window info:
{
	"id":3663,
	"pid":81298,
	"app":"Alacritty",
	"title":"~",
	"frame":{
		"x":12.0000,
		"y":44.0000,
		"w":1488.0000,
		"h":926.0000
	},
	"role":"AXWindow",
	"subrole":"AXStandardWindow",
	"display":1,
	"space":2,
	"level":0,
	"layer":"normal",
	"opacity":1.0000,
	"split-type":"none",
	"split-child":"second_child",
	"stack-index":2,
	"can-move":true,
	"can-resize":true,
	"has-focus":false,
	"has-shadow":true,
	"has-parent-zoom":false,
	"has-fullscreen-zoom":false,
	"is-native-fullscreen":false,
	"is-visible":false,
	"is-minimized":false,
	"is-hidden":false,
	"is-floating":false,
	"is-sticky":false,
	"is-grabbed":false
}
"""


def main():
    parser = argparse.ArgumentParser(
        prog="Restore window states",
        description="Restore states of windows when the layouts are changed",
    )

    parser.add_argument("--window-output", "-w")

    args = parser.parse_args()

    if not args.window_output:
        return

    path = Path(args.window_output)

    if not path.is_file():
        print(f"{args.window_output} doesn't exist.")
        return

    with open(args.window_output) as file:
        window_output = file.read()
        try:
            window_info = json.loads(window_output)
        except Exception as e:
            print(e)
            return
        order = []

        for info in window_info:
            if info["split-child"] == "first_child":
                order.insert(0, info['id'])
            elif info["split-child"] == "second_child":
                order.append(info['id'])

        for window_id in order:
            warp_into_space(window_id)


def warp_into_space(id: int):
    subprocess.run(["yabai", "-m", "window", str(id), "--warp", "next"])


main()
