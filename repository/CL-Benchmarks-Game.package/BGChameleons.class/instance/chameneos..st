benchmarking
chameneos: n
    | c1 c2 c3 c4 mp |
    c1 := chameleonFactory color: #blue.
    c2 := chameleonFactory color: #red.
    c3 := chameleonFactory color: #yellow.
    c4 := chameleonFactory color: #blue.
    mp := meetingPlaceFactory forMeetings: n.
    c1 fork: mp.
    c2 fork: mp.
    c3 fork: mp.
    c4 fork: mp.
    c1 wait.
    c2 wait.
    c3 wait.
    c4 wait.
    ^ c1 meetings + c2 meetings + c3 meetings + c4 meetings