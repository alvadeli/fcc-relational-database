#!/bin/bash
cat $1 | sed 's/catnip/dogchow/g; s/cat/dog/g; s/meow|meowzer/woof/g' -r

# command | command
#| pipe output of command as input to next command

#command < input.txt      
#redirection of input

#command > output.txt
#redirection of output, creats or overwrites file

#command >> output.txt
#redirection of output, append to file

#command 2> error.txt
#redirection of error, append to file