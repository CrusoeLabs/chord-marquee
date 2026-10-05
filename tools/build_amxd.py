#!/usr/bin/env python3
"""Package a Max patch JSON document as an Ableton Max MIDI Effect."""

from __future__ import annotations

import argparse
import shutil
import struct
from pathlib import Path


AMPF_HEADER = b"ampf" + struct.pack("<I", 4)
MIDI_EFFECT_METADATA = b"mmmmmeta" + struct.pack("<II", 4, 0)


def package(source: Path, destination: Path) -> None:
    patch = source.read_bytes()
    if not patch.lstrip().startswith(b"{"):
        raise ValueError(f"{source} does not look like a Max JSON patch")

    payload = AMPF_HEADER + MIDI_EFFECT_METADATA + b"ptch" + struct.pack("<I", len(patch)) + patch
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_bytes(payload)

    for dependency in source.parent.glob("*.js"):
        shutil.copy2(dependency, destination.parent / dependency.name)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("source", type=Path)
    parser.add_argument("destination", type=Path)
    args = parser.parse_args()
    package(args.source, args.destination)


if __name__ == "__main__":
    main()
