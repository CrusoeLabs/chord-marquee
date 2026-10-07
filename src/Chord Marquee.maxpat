{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 9,
      "minor": 0,
      "revision": 0,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [80.0, 80.0, 760.0, 420.0],
    "openinpresentation": 1,
    "default_fontname": "Ableton Sans Medium",
    "default_fontsize": 11.0,
    "gridonopen": 1,
    "gridsize": [15.0, 15.0],
    "boxes": [
      {
        "box": {
          "id": "midi-in",
          "maxclass": "newobj",
          "text": "midiin",
          "patching_rect": [30.0, 330.0, 43.0, 22.0]
        }
      },
      {
        "box": {
          "id": "midi-out",
          "maxclass": "newobj",
          "text": "midiout",
          "patching_rect": [30.0, 370.0, 50.0, 22.0]
        }
      },
      {
        "box": {
          "id": "this-device",
          "maxclass": "newobj",
          "text": "live.thisdevice",
          "patching_rect": [110.0, 330.0, 88.0, 22.0]
        }
      },
      {
        "box": {
          "id": "ready-trigger",
          "maxclass": "newobj",
          "text": "t b",
          "patching_rect": [110.0, 370.0, 30.0, 22.0]
        }
      },
      {
        "box": {
          "id": "init-message",
          "maxclass": "message",
          "text": "init",
          "patching_rect": [160.0, 370.0, 34.0, 22.0]
        }
      },
      {
        "box": {
          "id": "engine",
          "maxclass": "newobj",
          "text": "js chord_marquee.js",
          "patching_rect": [245.0, 330.0, 126.0, 22.0]
        }
      },
      {
        "box": {
          "id": "current-set",
          "maxclass": "newobj",
          "text": "prepend set",
          "patching_rect": [245.0, 370.0, 78.0, 22.0]
        }
      },
      {
        "box": {
          "id": "next-set",
          "maxclass": "newobj",
          "text": "prepend set",
          "patching_rect": [335.0, 370.0, 78.0, 22.0]
        }
      },
      {
        "box": {
          "id": "countdown-set",
          "maxclass": "newobj",
          "text": "prepend set",
          "patching_rect": [425.0, 370.0, 78.0, 22.0]
        }
      },
      {
        "box": {
          "id": "current-label",
          "maxclass": "comment",
          "text": "CURRENT",
          "fontsize": 9.0,
          "patching_rect": [30.0, 60.0, 70.0, 20.0],
          "presentation": 1,
          "presentation_rect": [12.0, 8.0, 80.0, 18.0]
        }
      },
      {
        "box": {
          "id": "current-panel",
          "maxclass": "panel",
          "background": 1,
          "mode": 0,
          "rounded": 8,
          "bgcolor": [0.12, 0.12, 0.12, 1.0],
          "patching_rect": [30.0, 85.0, 210.0, 130.0],
          "presentation": 1,
          "presentation_rect": [12.0, 28.0, 195.0, 130.0]
        }
      },
      {
        "box": {
          "id": "current-display",
          "maxclass": "comment",
          "text": "—",
          "fontsize": 38.0,
          "fontface": 1,
          "textjustification": 1,
          "ignoreclick": 1,
          "patching_rect": [30.0, 125.0, 210.0, 50.0],
          "presentation": 1,
          "presentation_rect": [12.0, 68.0, 195.0, 50.0]
        }
      },
      {
        "box": {
          "id": "next-label",
          "maxclass": "comment",
          "text": "NEXT",
          "fontsize": 9.0,
          "patching_rect": [260.0, 60.0, 55.0, 20.0],
          "presentation": 1,
          "presentation_rect": [219.0, 8.0, 80.0, 18.0]
        }
      },
      {
        "box": {
          "id": "next-panel",
          "maxclass": "panel",
          "background": 1,
          "mode": 0,
          "rounded": 8,
          "bgcolor": [0.12, 0.12, 0.12, 1.0],
          "patching_rect": [260.0, 85.0, 210.0, 130.0],
          "presentation": 1,
          "presentation_rect": [219.0, 28.0, 195.0, 130.0]
        }
      },
      {
        "box": {
          "id": "next-display",
          "maxclass": "comment",
          "text": "—",
          "fontsize": 38.0,
          "fontface": 1,
          "textjustification": 1,
          "ignoreclick": 1,
          "patching_rect": [260.0, 125.0, 210.0, 50.0],
          "presentation": 1,
          "presentation_rect": [219.0, 68.0, 195.0, 50.0]
        }
      },
      {
        "box": {
          "id": "countdown-display",
          "maxclass": "message",
          "text": "",
          "fontsize": 11.0,
          "textjustification": 1,
          "patching_rect": [425.0, 85.0, 100.0, 30.0],
          "presentation": 1,
          "presentation_rect": [426.0, 61.0, 76.0, 28.0]
        }
      },
      {
        "box": {
          "id": "refresh-button",
          "maxclass": "live.text",
          "text": "Refresh",
          "texton": "Refresh",
          "mode": 0,
          "parameter_enable": 0,
          "patching_rect": [545.0, 85.0, 70.0, 25.0],
          "presentation": 1,
          "presentation_rect": [428.0, 28.0, 72.0, 24.0]
        }
      },
      {
        "box": {
          "id": "refresh-message",
          "maxclass": "message",
          "text": "init",
          "patching_rect": [615.0, 330.0, 50.0, 22.0]
        }
      },
      {
        "box": {
          "id": "window-button",
          "maxclass": "live.text",
          "text": "Window",
          "texton": "Window",
          "mode": 0,
          "parameter_enable": 0,
          "patching_rect": [545.0, 125.0, 70.0, 25.0],
          "presentation": 1,
          "presentation_rect": [428.0, 100.0, 72.0, 24.0]
        }
      },
      {
        "box": {
          "id": "window-open-message",
          "maxclass": "newobj",
          "text": "prepend windowstate",
          "patching_rect": [615.0, 370.0, 132.0, 22.0]
        }
      },
      {
        "box": {
          "id": "window-toggle",
          "maxclass": "toggle",
          "patching_rect": [665.0, 330.0, 24.0, 24.0]
        }
      },
      {
        "box": {
          "id": "window-label-select",
          "maxclass": "newobj",
          "text": "sel 0 1",
          "patching_rect": [675.0, 405.0, 48.0, 22.0]
        }
      },
      {
        "box": {
          "id": "window-label-off",
          "maxclass": "message",
          "text": "text Window",
          "patching_rect": [610.0, 445.0, 78.0, 22.0]
        }
      },
      {
        "box": {
          "id": "window-label-on",
          "maxclass": "message",
          "text": "text Close",
          "patching_rect": [700.0, 445.0, 70.0, 22.0]
        }
      },
      {
        "box": {
          "id": "window-current",
          "maxclass": "newobj",
          "text": "prepend current",
          "patching_rect": [245.0, 405.0, 102.0, 22.0]
        }
      },
      {
        "box": {
          "id": "window-next",
          "maxclass": "newobj",
          "text": "prepend next",
          "patching_rect": [360.0, 405.0, 92.0, 22.0]
        }
      },
      {
        "box": {
          "id": "window-countdown",
          "maxclass": "newobj",
          "text": "prepend countdown",
          "patching_rect": [465.0, 405.0, 126.0, 22.0]
        }
      },
      {
        "box": {
          "id": "window-renderer",
          "maxclass": "newobj",
          "text": "js chord_marquee_window.js",
          "patching_rect": [245.0, 445.0, 174.0, 22.0]
        }
      },
      {
        "box": {
          "id": "window-canvas",
          "maxclass": "newobj",
          "text": "jit.lcd 4 char 800 450",
          "patching_rect": [245.0, 485.0, 142.0, 22.0]
        }
      },
      {
        "box": {
          "id": "floating-window",
          "maxclass": "newobj",
          "text": "jit.window chord_marquee @title Chord Marquee @size 800 450 @visible 0 @floating 0",
          "patching_rect": [245.0, 525.0, 515.0, 22.0]
        }
      }
    ],
    "lines": [
      {"patchline": {"source": ["midi-in", 0], "destination": ["midi-out", 0]}},
      {"patchline": {"source": ["this-device", 0], "destination": ["ready-trigger", 0]}},
      {"patchline": {"source": ["ready-trigger", 0], "destination": ["init-message", 0]}},
      {"patchline": {"source": ["init-message", 0], "destination": ["engine", 0]}},
      {"patchline": {"source": ["refresh-button", 0], "destination": ["refresh-message", 0]}},
      {"patchline": {"source": ["refresh-message", 0], "destination": ["engine", 0]}},
      {"patchline": {"source": ["engine", 0], "destination": ["current-set", 0]}},
      {"patchline": {"source": ["current-set", 0], "destination": ["current-display", 0]}},
      {"patchline": {"source": ["engine", 1], "destination": ["next-set", 0]}},
      {"patchline": {"source": ["next-set", 0], "destination": ["next-display", 0]}},
      {"patchline": {"source": ["engine", 2], "destination": ["countdown-set", 0]}},
      {"patchline": {"source": ["countdown-set", 0], "destination": ["countdown-display", 0]}},
      {"patchline": {"source": ["window-button", 0], "destination": ["window-toggle", 0]}},
      {"patchline": {"source": ["window-toggle", 0], "destination": ["window-open-message", 0]}},
      {"patchline": {"source": ["window-toggle", 0], "destination": ["window-label-select", 0]}},
      {"patchline": {"source": ["window-label-select", 0], "destination": ["window-label-off", 0]}},
      {"patchline": {"source": ["window-label-select", 1], "destination": ["window-label-on", 0]}},
      {"patchline": {"source": ["window-label-off", 0], "destination": ["window-button", 0]}},
      {"patchline": {"source": ["window-label-on", 0], "destination": ["window-button", 0]}},
      {"patchline": {"source": ["window-open-message", 0], "destination": ["window-renderer", 0]}},
      {"patchline": {"source": ["engine", 0], "destination": ["window-current", 0]}},
      {"patchline": {"source": ["window-current", 0], "destination": ["window-renderer", 0]}},
      {"patchline": {"source": ["engine", 1], "destination": ["window-next", 0]}},
      {"patchline": {"source": ["window-next", 0], "destination": ["window-renderer", 0]}},
      {"patchline": {"source": ["engine", 2], "destination": ["window-countdown", 0]}},
      {"patchline": {"source": ["window-countdown", 0], "destination": ["window-renderer", 0]}},
      {"patchline": {"source": ["window-renderer", 0], "destination": ["window-canvas", 0]}},
      {"patchline": {"source": ["window-renderer", 1], "destination": ["floating-window", 0]}},
      {"patchline": {"source": ["window-canvas", 0], "destination": ["floating-window", 0]}}
    ],
    "dependency_cache": [
      {
        "name": "chord_marquee.js",
        "bootpath": ".",
        "type": "TEXT",
        "implicit": 1
      },
      {
        "name": "chord_marquee_window.js",
        "bootpath": ".",
        "type": "TEXT",
        "implicit": 1
      }
    ],
    "autosave": 0
  }
}
