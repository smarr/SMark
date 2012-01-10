initialize-release
initialize: size
   perm := OstArray fromArray: (1 to: size) asArray.
   timesRotated := Array new: size withAll: 0.
   atEnd := false.