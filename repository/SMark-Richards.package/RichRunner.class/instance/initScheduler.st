private
initScheduler
    queuePacketCount := 0.
    holdCount := 0.
    taskTable := Array new: 6 withAll: RichObject NoTask.
    taskList := RichObject NoTask.