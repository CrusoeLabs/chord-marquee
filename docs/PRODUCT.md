# Product definition

## Core workflow

1. The user creates a MIDI track named `CHORDS`.
2. Empty Arrangement clips are placed for each chord's duration.
3. Each clip is named with the chord to display, such as `Am`, `C`, or `F`.
4. Chord Marquee follows Live's transport and displays the active clip name.

## Version 1 scope

- Compact Device View showing current chord, next chord, and countdown.
- Resizable floating window showing the same synchronized information.
- Optional always-on-top floating window.
- Adjustable text size and light/dark themes.
- Correct behavior during play, pause, looping, scrubbing, and position jumps.
- Refresh/reconnect control when the chord track or clips change.
- No MIDI or audio processing.
- No automatic chord detection.

## Distribution

- Free and open source under the MIT License.
- Editable sources live in `src/`.
- Frozen release devices live in `dist/` and are attached to GitHub releases.
- Intended public repository: `CrusoeLabs/chord-marquee`.

