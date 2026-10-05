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
          "id": "status-set",
          "maxclass": "newobj",
          "text": "prepend set",
          "patching_rect": [515.0, 370.0, 78.0, 22.0]
        }
      },
      {
        "box": {
          "id": "title",
          "maxclass": "comment",
          "text": "CHORD MARQUEE",
          "fontsize": 12.0,
          "fontface": 1,
          "patching_rect": [30.0, 25.0, 125.0, 20.0],
          "presentation": 1,
          "presentation_rect": [12.0, 8.0, 120.0, 20.0]
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
          "presentation_rect": [12.0, 32.0, 62.0, 18.0]
        }
      },
      {
        "box": {
          "id": "current-display",
          "maxclass": "message",
          "text": "—",
          "fontsize": 28.0,
          "fontface": 1,
          "textjustification": 1,
          "patching_rect": [30.0, 85.0, 210.0, 55.0],
          "presentation": 1,
          "presentation_rect": [12.0, 50.0, 175.0, 50.0]
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
          "presentation_rect": [200.0, 32.0, 45.0, 18.0]
        }
      },
      {
        "box": {
          "id": "next-display",
          "maxclass": "message",
          "text": "—",
          "fontsize": 20.0,
          "fontface": 1,
          "textjustification": 1,
          "patching_rect": [260.0, 85.0, 150.0, 55.0],
          "presentation": 1,
          "presentation_rect": [200.0, 50.0, 125.0, 50.0]
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
          "presentation_rect": [335.0, 62.0, 90.0, 28.0]
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
          "presentation_rect": [438.0, 59.0, 62.0, 24.0]
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
          "id": "status-display",
          "maxclass": "message",
          "text": "Waiting for Live...",
          "fontsize": 9.0,
          "patching_rect": [30.0, 165.0, 585.0, 25.0],
          "presentation": 1,
          "presentation_rect": [12.0, 106.0, 488.0, 22.0]
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
      {"patchline": {"source": ["engine", 3], "destination": ["status-set", 0]}},
      {"patchline": {"source": ["status-set", 0], "destination": ["status-display", 0]}}
    ],
    "dependency_cache": [
      {
        "name": "chord_marquee.js",
        "bootpath": ".",
        "type": "TEXT",
        "implicit": 1
      }
    ],
    "autosave": 0
  }
}
