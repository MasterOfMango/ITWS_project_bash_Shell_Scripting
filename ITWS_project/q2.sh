#!/bin/bash

HISTFILE=~/.bash_history
set -o history
history | cut -c 8- | cut -d'|' -f 1 | cut -d' ' -f 1 | sort | uniq -c | sort -bnr | tr -s ' ' | awk '{t = $1; $1 = $2; $2 = t; print;}'
