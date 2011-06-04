initialization
initialize
	mtxCritical := Semaphore forMutualExclusion.
	mtxNotify := Semaphore new.