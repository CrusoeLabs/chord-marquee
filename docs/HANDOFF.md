# Chord Marquee project handoff

Last updated: 2026-10-07

## Purpose

Chord Marquee is a free, open-source Max for Live MIDI Effect for Ableton Live
12. It displays chord labels that the user programs as named Arrangement clips
on a MIDI track named `CHORDS`.

Repository: <https://github.com/CrusoeLabs/chord-marquee>

Local checkout: `/Volumes/ThinkThing1TB/dev/m4l/chord-marquee`

License: MIT

## Current state

The Device View prototype is working in Ableton Live and has been tested by the
project owner. It currently shows:

- the chord active at Live's current Arrangement position;
- the next chord;
- a beat countdown until the next chord;
- a Refresh button.

The Device View layout has full-height Current and Next panels, vertically
centered chord labels, headings above the panels, and the beat countdown below
the Refresh button. The earlier internal title and status row were removed from
the visible device UI.

The floating, resizable chord window described in the product definition has
not been implemented yet. Treat the current build as an early prototype rather
than a finished v1 release.

## User workflow

1. Add `dist/Chord Marquee.amxd` to a MIDI track.
2. Keep `dist/chord_marquee.js` beside the `.amxd` file.
3. Create another MIDI track named `CHORDS`.
4. Add empty MIDI clips in Arrangement View and name them with chord symbols
   such as `Am`, `C`, or `F`.
5. Press Refresh after adding, moving, resizing, or renaming chord clips.
6. Start playback or move Live's transport to see the display update.

## Repository map

- `src/Chord Marquee.maxpat` — editable Max patch JSON.
- `src/chord_marquee.js` — Live API polling and chord-selection logic.
- `dist/Chord Marquee.amxd` — installable Ableton Max MIDI Effect.
- `dist/chord_marquee.js` — runtime dependency; currently distributed beside
  the device.
- `tools/build_amxd.py` — packages the Max patch as an AMPF `.amxd` container
  and copies JavaScript dependencies into `dist/`.
- `docs/PRODUCT.md` — intended v1 scope and distribution plan.
- `README.md` — installation and development-test instructions.

## Implementation notes

`src/chord_marquee.js` uses `LiveAPI` to locate the first track whose name,
case-insensitively, equals `CHORDS`. Refresh reads that track's
`arrangement_clips`, records each clip's name, start time, and end time, and
sorts the clips by start time.

A Max `Task` polls `live_set current_song_time` every 100 ms. Four outlets
provide the current chord, next chord, countdown, and internal status. Output is
suppressed when a value has not changed.

The implementation does not process MIDI or audio and does not detect chords
automatically. Clip names are the source of truth.

## Build

From the repository root:

```sh
python3 tools/build_amxd.py "src/Chord Marquee.maxpat" "dist/Chord Marquee.amxd"
```

After rebuilding, keep the generated `.amxd` and copied JavaScript file
together when testing or distributing the prototype.

## Manual verification

1. Open Ableton Live 12 with Max for Live available.
2. Create a MIDI track named `CHORDS` and add several named Arrangement clips.
3. Drag `dist/Chord Marquee.amxd` onto a MIDI track.
4. Press Refresh.
5. Play, pause, scrub, and jump between clips.
6. Confirm Current, Next, and the countdown follow the transport.
7. Resize Device View and confirm both chord panels fill the available height
   without hiding their text.
8. Rename or move a chord clip, press Refresh, and confirm the display reflects
   the edit.

There is no automated Ableton/Max test suite yet.

## Known limitations

- No floating window yet.
- Refresh is manual after editing chord clips.
- The `.amxd` is not yet a self-contained frozen release; the JavaScript file
  must remain beside it.
- Only the first track named `CHORDS` is used.
- Arrangement clips only; Session View is not supported.
- Overlapping clips and end-of-song/loop behavior need broader testing.
- No automatic chord detection.

## Recommended next steps

1. Implement the synchronized floating window, including resizing and optional
   always-on-top behavior.
2. Exercise looping, scrubbing, playback jumps, overlapping clips, and gaps.
3. Decide whether clip edits should be observed automatically or continue to
   require Refresh.
4. Freeze/package a self-contained release device so users can install one
   `.amxd` without managing a separate JavaScript file.
5. Add a version number, changelog, screenshots or a short demo GIF, and a
   GitHub Release ZIP.
6. Publish the free device on MaxforLive.com and announce it to Ableton/Max
   communities after the release artifact is ready.

## Git status at handoff

- Default branch: `main`
- Remote: `https://github.com/CrusoeLabs/chord-marquee.git`
- Last implementation commit before this document: `833333a` (`Include
  installable prototype build`)
- The repository was clean and synchronized with `origin/main` before this
  handoff document was added.

## Conversation continuity

The original Codex task contains the full design and troubleshooting history,
including screenshots from Ableton Live and the UI iterations. It was titled
`Build the Chord Marquee M4L Device`. Keep that original task unarchived as the
historical record. New project tasks should treat this file, `README.md`, and
`docs/PRODUCT.md` as the durable starting context.
