# Chord Marquee

Chord Marquee is a free Max for Live device that displays programmed chord
changes while Ableton Live's Arrangement is playing.

The device is planned to provide two synchronized views:

- a compact display in Live's Device View;
- a large, resizable floating window for practice and performance.

Chord changes will be read from named clips on a dedicated MIDI track. The
current chord, next chord, and time until the next change will follow Live's
transport, including looping and position jumps.

## Status

Early development. A tested Device View prototype and an initial synchronized
floating-window build are available in `dist/`.

## Install

1. Download `Chord Marquee.amxd` and both JavaScript files from `dist/`.
2. Keep all three files together in the same folder.
3. Drag `Chord Marquee.amxd` onto a MIDI track in Ableton Live.
4. Create a MIDI track named `CHORDS` and add named Arrangement clips for the
   chord changes.
5. Press **Refresh** after adding, moving, resizing, or renaming chord clips.
6. Press **Window** to open the resizable floating chord display; press
   **Close** to hide it.

## Development test

1. Create a MIDI track named `CHORDS` in Arrangement View.
2. Add empty MIDI clips and name them with chord symbols.
3. Run `python3 tools/build_amxd.py "src/Chord Marquee.maxpat" "dist/Chord Marquee.amxd"`.
4. Drag `dist/Chord Marquee.amxd` onto a MIDI track.
5. Press **Refresh** after changing the chord clips.
6. Start playback and confirm the current and next chord displays update.

## Requirements

- Ableton Live 12
- Max for Live (included with Live Suite, or available as an add-on for Live
  Standard)

## License

Chord Marquee is released under the MIT License. See [LICENSE](LICENSE).
