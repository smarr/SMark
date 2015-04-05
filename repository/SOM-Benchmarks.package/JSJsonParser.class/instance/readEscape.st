parsing-private
readEscape
    self read.    
    captureBuffer := captureBuffer concatenate: self readEscapeChar.
    self read