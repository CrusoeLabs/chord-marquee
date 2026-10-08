autowatch = 1;
inlets = 1;
outlets = 4;

var TRACK_NAME = "CHORDS";
var POLL_MS = 100;
var songApi = null;
var pollTask = null;
var observerRefreshTask = null;
var songTracksObserver = null;
var songLoopObservers = [];
var trackNameObservers = [];
var arrangementObserver = null;
var clipObservers = [];
var clips = [];
var loopEnabled = false;
var loopStart = 0;
var loopLength = 0;
var lastCurrent = null;
var lastNext = null;
var lastCountdown = null;
var lastStatus = null;

function init() {
    try {
        songApi = new LiveAPI(null, "live_set");

        if (pollTask) {
            pollTask.cancel();
        }

        setupSongObserver();
        refresh();

        pollTask = new Task(poll, this);
        pollTask.interval = POLL_MS;
        pollTask.repeat();

    } catch (error) {
        setStatus("Live API unavailable: " + error);
    }
}

function refresh() {
    clips = [];
    clearTrackObservers();

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
            trackNameObservers.push(createRefreshObserver(candidatePath, "name"));

            if (!trackPath && String(trackName).toUpperCase() === TRACK_NAME) {
                trackPath = candidatePath;
            }
        }

        if (!trackPath) {
            outputDisplay("—", "—", "");
            setStatus("Create a MIDI track named " + TRACK_NAME);
            return;
        }

        var chordTrack = new LiveAPI(null, trackPath);
        arrangementObserver = createRefreshObserver(trackPath, "arrangement_clips");
        var clipCount = chordTrack.getcount("arrangement_clips");

        for (var j = 0; j < clipCount; j++) {
            var clipPath = trackPath + " arrangement_clips " + j;
            var clipApi = new LiveAPI(null, clipPath);
            var clip = {
                path: clipPath,
                name: String(valueOf(clipApi.get("name")) || "—"),
                start: Number(valueOf(clipApi.get("start_time"))),
                end: Number(valueOf(clipApi.get("end_time")))
            };
            clips.push(clip);
            clipObservers.push(createClipObserver(clip, "name"));
            clipObservers.push(createClipObserver(clip, "start_time"));
            clipObservers.push(createClipObserver(clip, "end_time"));
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

function setupSongObserver() {
    clearObserver(songTracksObserver);
    clearObserverList(songLoopObservers);
    songTracksObserver = createRefreshObserver("live_set", "tracks");
    loopEnabled = Number(valueOf(songApi.get("loop"))) !== 0;
    loopStart = Number(valueOf(songApi.get("loop_start")));
    loopLength = Number(valueOf(songApi.get("loop_length")));
    songLoopObservers.push(createLoopObserver("loop"));
    songLoopObservers.push(createLoopObserver("loop_start"));
    songLoopObservers.push(createLoopObserver("loop_length"));
}

function createLoopObserver(property) {
    var observer = new LiveAPI(function (args) {
        if (!args || args.length === 0 || String(args[0]) !== property) {
            return;
        }
        var value = valueOf(args);
        if (property === "loop") {
            loopEnabled = Number(value) !== 0;
        } else if (property === "loop_start") {
            loopStart = Number(value);
        } else if (property === "loop_length") {
            loopLength = Number(value);
        }
        poll();
    }, "live_set");
    observer.property = property;
    return observer;
}

function createRefreshObserver(path, property) {
    var receivedInitialValue = false;
    var observer = new LiveAPI(function (args) {
        if (!args || args.length === 0 || String(args[0]) !== property) {
            return;
        }
        if (!receivedInitialValue) {
            receivedInitialValue = true;
            return;
        }
        scheduleObserverRefresh();
    }, path);
    observer.property = property;
    return observer;
}

function createClipObserver(clip, property) {
    var observer = null;
    observer = new LiveAPI(function (args) {
        if (!args || args.length === 0 || String(args[0]) !== property) {
            return;
        }
        updateClipProperty(clip, property, valueOf(args));
    }, clip.path);
    observer.property = property;
    return observer;
}

function updateClipProperty(clip, property, value) {
    if (property === "name") {
        clip.name = String(value || "—");
    } else if (property === "start_time") {
        clip.start = Number(value);
    } else if (property === "end_time") {
        clip.end = Number(value);
    }

    clips.sort(function (a, b) {
        return a.start - b.start;
    });
    poll();
}

function scheduleObserverRefresh() {
    if (observerRefreshTask) {
        observerRefreshTask.cancel();
    }
    observerRefreshTask = new Task(runObserverRefresh, this);
    observerRefreshTask.schedule(25);
}

function runObserverRefresh() {
    observerRefreshTask = null;
    refresh();
}

function clearTrackObservers() {
    clearObserver(arrangementObserver);
    arrangementObserver = null;
    clearObserverList(trackNameObservers);
    clearObserverList(clipObservers);
}

function clearObserverList(observers) {
    for (var i = 0; i < observers.length; i++) {
        clearObserver(observers[i]);
    }
    observers.length = 0;
}

function clearObserver(observer) {
    if (observer) {
        try {
            observer.property = "";
        } catch (error) {
        }
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
        var nextWraps = false;

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

        var loopEnd = loopStart + loopLength;
        if (loopEnabled && loopLength > 0 && time >= loopStart && time < loopEnd) {
            var loopFirstIndex = findLoopFirstClip(loopStart, loopEnd);
            if (loopFirstIndex >= 0 &&
                    (nextIndex < 0 || clips[nextIndex].start >= loopEnd)) {
                nextIndex = loopFirstIndex;
                nextWraps = true;
            }
        }

        var currentName = currentIndex >= 0 ? clips[currentIndex].name : "—";
        var nextName = nextIndex >= 0 ? clips[nextIndex].name : "—";
        var countdown = "";

        if (nextIndex >= 0) {
            var beats;
            if (nextWraps) {
                beats = Math.max(0, loopEnd - time) +
                    Math.max(0, clips[nextIndex].start - loopStart);
            } else {
                beats = Math.max(0, clips[nextIndex].start - time);
            }
            countdown = formatBeats(beats);
        }

        outputDisplay(currentName, nextName, countdown);
    } catch (error) {
        setStatus("Playback tracking failed: " + error);
    }
}

function findLoopFirstClip(start, end) {
    for (var i = 0; i < clips.length; i++) {
        if (clips[i].start <= start && clips[i].end > start) {
            return i;
        }
        if (clips[i].start >= start && clips[i].start < end) {
            return i;
        }
    }
    return -1;
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
    if (observerRefreshTask) {
        observerRefreshTask.cancel();
        observerRefreshTask = null;
    }
    clearObserver(songTracksObserver);
    songTracksObserver = null;
    clearObserverList(songLoopObservers);
    clearTrackObservers();
}
