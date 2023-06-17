#!/usr/bin/env just --justfile

default:
    @just --list

# only the one right above the recipe is shown for `just -l`
# remove all references in path by removing [[ and ]]
unlink path:
    # path = {{path}}
    sd '\[\[' '' {{path}} && sd '\]\]' '' {{path}}

# find pages smaller than n_bytes
find-smaller-than n_bytes='100':
    fd pages --size -{{n_bytes}}b

sloc:
    echo "`wc -l pages/*.md` lines of code"
