accessing
wait
    | timeout |
	timeout := semaphore waitTimeoutSeconds: 2.
	timeout ifTrue: [Halt now].
