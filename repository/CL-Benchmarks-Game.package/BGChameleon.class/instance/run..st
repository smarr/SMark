running
run: meetingPlace
    [ color == #faded ] whileFalse: [
        meetingPlace reachedBy: self.
        waitingForPair wait ]