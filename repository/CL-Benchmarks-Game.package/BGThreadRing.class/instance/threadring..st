benchmark game
threadring: numHops
   | done first finalId |
   done  := Semaphore new.

   first := self createThreadRing: [:id | finalId := id.
														 done signal].

   first takeToken: numHops. "start the ring traversal"

   done wait.

   ^ finalId