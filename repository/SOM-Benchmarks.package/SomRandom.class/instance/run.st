running
run
        | fail |
        ScriptConsole << 'Testing random number generator ... '.
        fail := [ ScriptConsole << 'FAILED:'; cr. ^nil ].
        (self next ~= 22896) ifTrue: fail.
        (self next ~= 34761) ifTrue: fail.
        (self next ~= 34014) ifTrue: fail.
        (self next ~= 39231) ifTrue: fail.
        (self next ~= 52540) ifTrue: fail.
        (self next ~= 41445) ifTrue: fail.
        (self next ~=  1546) ifTrue: fail.
        (self next ~=  5947) ifTrue: fail.
        (self next ~= 65224) ifTrue: fail.
        ScriptConsole << 'PASSED'; cr.