autowatch = 1;
inlets = 1;
outlets = 4;

var TRACK_NAME = "CHORDS";
var POLL_MS = 100;
var songApi = null;
var pollTask = null;
var clips = [];
var lastCurrent = null;
var lastNext = null;
var lastCountdown = null;
var lastStatus = null;

function init() {
    try {
        songApi = new LiveAPI(null, "live_set");
        refresh();

        if (pollTask) {
            pollTask.cancel();
        }
        pollTask = new Task(poll, this);
        pollTask.interval = POLL_MS;
        pollTask.repeat();
    } catch (error) {
        setStatus("Live API unavailable: " + error);
    }
}

function refresh() {
    clips = [];

    if (!songApi) {
        setStatus("Waiting for Live...");
        return;
    }

    try {
        var trackCount = songApi.getcount("tracks");
        var trackPath = null;

        for (var i = 0; i < trackCount; i++) {
            var candidatePath = "live_set tracks " + i;
            var trackApi = new LiveAPI(null, candidatePath);
            var trackName = valueOf(trackApi.get("name"));

            if (String(trackName).toUpperCase() === TRACK_NAME) {
                trackPath = candidatePath;
                break;
            }
        }

        if (!trackPath) {
            outputDisplay("—", "—", "");
            setStatus("Create a MIDI track named " + TRACK_NAME);
            return;
        }

        var chordTrack = new LiveAPI(null, trackPath);
        var clipCount = chordTrack.getcount("arrangement_clips");

        for (var j = 0; j < clipCount; j++) {
            var clipApi = new LiveAPI(null, trackPath + " arrangement_clips " + j);
            clips.push({
                name: String(valueOf(clipApi.get("name")) || "—"),
                start: Number(valueOf(clipApi.get("start_time"))),
                end: Number(valueOf(clipApi.get("end_time")))
            });
        }

        clips.sort(function (a, b) {
            return a.start - b.start;
        });

        if (clips.length === 0) {
            outputDisplay("—", "—", "");
            setStatus("Add named Arrangement clips to " + TRACK_NAME);
        } else {
            setStatus("Ready · " + clips.length + " chord clips");
            poll();
        }
    } catch (error) {
        setStatus("Refresh failed: " + error);
    }
}

function poll() {
    if (!songApi || clips.length === 0) {
        return;
    }

    try {
        var time = Number(valueOf(songApi.get("current_song_time")));
        var currentIndex = -1;
        var nextIndex = -1;

        for (var i = 0; i < clips.length; i++) {
            if (time >= clips[i].start && time < clips[i].end) {
                currentIndex = i;
                nextIndex = i + 1 < clips.length ? i + 1 : -1;
                break;
            }
            if (clips[i].start > time) {
                nextIndex = i;
                break;
            }
        }

        var currentName = currentIndex >= 0 ? clips[currentIndex].name : "—";
        var nextName = nextIndex >= 0 ? clips[nextIndex].name : "—";
        var countdown = "";

        if (nextIndex >= 0) {
            var beats = Math.max(0, clips[nextIndex].start - time);
            countdown = formatBeats(beats);
        }

        outputDisplay(currentName, nextName, countdown);
    } catch (error) {
        setStatus("Playback tracking failed: " + error);
    }
}

function formatBeats(beats) {
    if (beats < 0.05) {
        return "now";
    }
    var rounded = Math.round(beats * 10) / 10;
    return rounded + (rounded === 1 ? " beat" : " beats");
}

function outputDisplay(currentName, nextName, countdown) {
    if (currentName !== lastCurrent) {
        outlet(0, currentName);
        lastCurrent = currentName;
    }
    if (nextName !== lastNext) {
        outlet(1, nextName);
        lastNext = nextName;
    }
    if (countdown !== lastCountdown) {
        outlet(2, countdown);
        lastCountdown = countdown;
    }
}

function setStatus(message) {
    if (message !== lastStatus) {
        outlet(3, message);
        lastStatus = message;
    }
}

function valueOf(value) {
    if (value instanceof Array) {
        if (value.length === 0) {
            return "";
        }
        if (value.length === 1) {
            return value[0];
        }
        return value.slice(1).join(" ");
    }
    return value;
}

function notifydeleted() {
    if (pollTask) {
        pollTask.cancel();
        pollTask = null;
    }
}

