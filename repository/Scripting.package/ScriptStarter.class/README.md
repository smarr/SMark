ScriptStarter provides a startUp method and registers itself on the startUpList to enable scripting using command-line arguments.

The first argument on the command-line is used to identify a class on which #run: is invoked with the arguments as an array.

#run: can be used similar to classic main(String[] args) methods in other languages. 