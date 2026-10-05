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

Early development. The first Device View prototype lives in `src/` and is not
yet a tested release.

## Development test

1. Create a MIDI track named `CHORDS` in Arrangement View.
2. Add empty MIDI clips and name them with chord symbols.
3. Drag `src/Chord Marquee.amxd` onto a MIDI track.
4. Press **Refresh** after changing the chord clips.
5. Start playback and confirm the current and next chord displays update.

## Requirements

- Ableton Live 12
- Max for Live (included with Live Suite, or available as an add-on for Live
  Standard)

## License

Chord Marquee is released under the MIT License. See [LICENSE](LICENSE).
