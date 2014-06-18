#!/bin/bash
if [ $# -ne 1 ]
    then
        echo "Bad arguments, correct usage is:"
        echo "user@host"
        echo "example: GBurdell@gatech.edu"
else
    echo  "Enter the remote user's password."
    ssh -N $1 -L 3690:localhost:3389 -f || exit 1

    printf "\nCheck iTunes for your shared Library.\n"
    printf "Use Control+C to break the connection.\n\n"

    echo "Status:"
    dns-sd -P "iTunesServer" _daap._tcp local 3690 local 127.0.0.1 "text"
fi
