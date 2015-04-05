accessing
maxRuntime: seconds
        "converted to microseconds i.e. ticks"
        seconds ifNotNil: [
            maxRuntime := seconds * 1000 * 1000].
