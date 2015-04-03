parsing-private
pauseCapture
    captureBuffer := captureBuffer concatenate: (
      input substringFrom: captureStart to: index - 1).
    captureStart := -1