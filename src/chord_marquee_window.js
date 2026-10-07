autowatch = 1;
inlets = 1;
outlets = 2;

var currentChord = "—";
var nextChord = "—";
var countdownText = "";

function current() {
    currentChord = joinArguments(arguments) || "—";
    draw();
}

function next() {
    nextChord = joinArguments(arguments) || "—";
    draw();
}

function countdown() {
    countdownText = joinArguments(arguments);
    draw();
}

function windowstate(value) {
    var visible = Number(value) !== 0 ? 1 : 0;
    outlet(1, "visible", visible);
    if (visible) {
        draw();
    }
}

function draw() {
    outlet(0, "brgb", 24, 24, 24);
    outlet(0, "clear");

    drawCard(35, 55, 385, 370, "CURRENT", currentChord, 62, 225, 255, 255, 255);
    drawCard(415, 55, 765, 370, "NEXT", nextChord, 56, 225, 205, 205, 205);

    outlet(0, "font", "Arial", 24);
    outlet(0, "frgb", 175, 175, 175);
    outlet(0, "moveto", centeredX(countdownText, 24, 800), 420);
    outlet(0, "write", countdownText);
    outlet(0, "bang");
}

function drawCard(left, top, right, bottom, heading, chord, chordSize, baseline, red, green, blue) {
    outlet(0, "frgb", 40, 40, 40);
    outlet(0, "paintrect", left, top, right, bottom);

    outlet(0, "font", "Arial", 18);
    outlet(0, "frgb", 150, 150, 150);
    outlet(0, "moveto", left + 20, top + 32);
    outlet(0, "write", heading);

    outlet(0, "font", "Arial", chordSize);
    outlet(0, "frgb", red, green, blue);
    outlet(0, "moveto", centeredX(chord, chordSize, right - left) + left, baseline);
    outlet(0, "write", chord);
}

function centeredX(text, size, width) {
    var estimate = String(text).length * size * 0.56;
    return Math.max(12, Math.round((width - estimate) / 2));
}

function joinArguments(args) {
    var values = arrayfromargs(args);
    return values.join(" ");
}
